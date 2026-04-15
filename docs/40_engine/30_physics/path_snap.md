# CPath Snap & Correction

The `CPath` class owns the per-layer path node arrays consumed at runtime by
`CObject::DoPathLogic` and `CMonster_J::DoPathLogic` (path-follow branch).
Several helpers apply per-frame snap-to-path corrections.

## Path object layout

Inferred from reads across `CPath::*` methods:

| Offset | Type  | Field                                             |
|--------|-------|---------------------------------------------------|
| +0x08  | ptr   | `i16* x[]` — path node X coordinates              |
| +0x0c  | ptr   | `i16* y[]` — path node Y coordinates              |
| +0x10  | ptr   | `i16* angle[]` — per-segment angle (degrees)     |
| +0x14  | i32   | node count                                        |

## API (existing and confirmed)

| Symbol                           | Vaddr     | Size  | Role                                |
|----------------------------------|-----------|-------|-------------------------------------|
| `CPath::GetPathIndexPos`         | `0x9d091` | 188 B | map (x, y) → node index             |
| `CPath::GetPathIndexPosX`        | `0x9d3a1` | 92 B  | map x → node index                  |
| `CPath::GetPathIndexPosY`        | `0x9d14d` | 92 B  | map y → node index                  |
| `CPath::GetPathPosX`             | `0x9bc2d` | 8 B   | get x at node idx                   |
| `CPath::GetPathPosY`             | `0x9bc35` | 8 B   | get y at node idx                   |
| `CPath::GetPathPosXY`            | `0x9bc3d` | 18 B  | get (x,y) tuple                     |
| `CPath::GetPathAngle`            | `0x9bc25` | 8 B   | get angle at node idx               |
| `CPath::GetPathType`             | `0x9bc1d` | 6 B   | get type at node idx                |
| `CPath::SetPathType`             | `0x9bc15` | 6 B   | set type at node idx                |
| `CPath::IsInnerPositionX`        | `0x9bbbd` | 42 B  | is x within path range?             |
| `CPath::IsInnerPositionY`        | `0x9bbe9` | 42 B  | is y within path range?             |
| `CPath::GetCorrectionPosX`       | `0x9d351` | 80 B  | compute x given y (for given node)  |
| `CPath::GetCorrectionPosY`       | `0x9d5cd` | 80 B  | compute y given x (sloped surface)  |
| `CPath::GetCorrectionMovePosX`   | `0x9d1a9` | 424 B | corrected x after movement          |
| `CPath::GetCorrectionMovePosY`   | `0x9d3fd` | 464 B | corrected y after movement          |
| **`CPath::GetCorrectionMovePos`**| `0x9cb89` | 1288 B| full-movement path snap (main)      |

## `GetCorrectionPosY` — slope formula (already decoded)

```
GetCorrectionPosY(x_arg, &out_y):
  idx = GetPathIndexPosX(x_arg)
  if idx valid:
    angle = path.angle[idx]
    *out_y = path.y[idx]
    tan100 = KTan100(angle + 180°)
    dy = path.dy[idx]  # per-segment Y delta
    correction = ((x_arg - x_anchor) * tan100 + 100*dy) / 100
              = dx * tan(angle) + dy
```

Standard sloped-surface formula. Used per-frame for path-attached objects.

## `GetCorrectionMovePos` — full snap

`CPath::GetCorrectionMovePos(output_pos, dir_flag, fp_arg, r6_arg,
sp[0x58]=extra_flag, sp[0x5c]=path_start_idx)` (`0x9cb89`, 1288 B, 619 insns).

### BL target profile

| Helper                     | Calls |
|----------------------------|-------|
| `KTan100`                  | 8     |
| `__divsi3`                 | 6     |
| `__aeabi_idivmod`          | 3     |
| `CNomUtil::Distance2D`     | 3     |
| `GsSin100`                 | 2     |
| `GsCos100`                 | 2     |

So the algorithm is **trig-heavy**: converts between angle space and
Cartesian coordinates, clamps movement along segments, and applies modular
arithmetic for path wrapping. Likely:

1. Walk from current node index, stepping segments in `dir_flag` direction.
2. For each segment, use `GsSin100`/`GsCos100(angle)` to decompose requested
   movement along vs perpendicular to segment.
3. Use `KTan100` to compute slope corrections.
4. Use `Distance2D` to detect when movement covers a full segment.
5. `__divsi3` / `__aeabi_idivmod` for fixed-point scaling (`× 100` factor
   consistent with `KTan100` / `GsSin100` / `GsCos100` returning values
   scaled by 100).

### Top-level dispatch

```
@0x9cba8  count = path.+0x14                         # node count
@0x9cbb6  if idx < 0: goto null_return @0x9ccb6
@0x9cbc0  if idx >= count: goto null_return @0x9ccb6
@0x9cbe0  if idx >= count-1: clamp (idx = count-1, ip)
@0x9cbec  load x[], y[], angle[] arrays              # path data setup
          # branch into per-segment loop based on dir_flag
```

Branch hot-spots (62 unique branch targets total in 1288 B):

| Address     | Role                                      | Incoming |
|-------------|-------------------------------------------|----------|
| `0x9ccb6`   | error/null-return setup (loads err result, falls into return) | 3 |
| `0x9ccb8`   | **common function return** (sp+=0x34; pop) | 8       |
| `0x9cc56`   | bounds check `idx < count-1` then forward step | 4 |
| `0x9cbec`   | path-array load (per-iter setup)           | 2       |
| `0x9cdce`   | forward-direction segment loop body        | 3       |
| `0x9cf54`   | reverse/alternate-direction segment loop   | 2       |
| `0x9cf9c`   | exit-with-truncation                       | 4       |
| `0x9cfa0`   | post-clamp output write                    | 2       |

So the function structure is:

```
GetCorrectionMovePos(out_pos, dir_flag, fp_arg, r6_arg, ...):
    bounds check on idx vs count
    if invalid: return null
    load path arrays
    if direction == forward:  loop @0x9cdce
        for each segment from idx forward:
            angle = path.angle[seg]
            (sin, cos) = (GsSin100(angle), GsCos100(angle))
            advance = move_along_segment(sin, cos, requested)
            if reached end: continue to next segment
            else: clamp at segment end
        write output
    else (reverse): loop @0x9cf54  (mirror logic)
    return result code
```

The existing `GetCorrectionPosX/Y` (80 B each) are the simple "snap to
current segment" variants; `GetCorrectionMovePosX/Y` (400+ B each) handle
"snap + advance one segment"; `GetCorrectionMovePos` (1288 B) is the full
"snap + advance along multiple segments with 2D distance tracking".

For recreation: a single function that walks path segments using
`(cos(angle), sin(angle))` for each step, accumulating distance via
`Distance2D`, and writes the final snapped position. The 8 KTan100 calls
within the function handle slope-aware Y correction at each step (combining
the slope formula with the segment walking).

## Open

- Per-branch decode of `GetCorrectionMovePos` (forward/reverse paths).
- Confirm return value layout — single i32 or packed x/y via output pointer?
- Map `sp[0x58]` / `sp[0x5c]` caller-provided extras.
