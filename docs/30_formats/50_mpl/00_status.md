# MPL Status

- Status: **structure + role + entry semantics fully decoded**
- Last updated: 2026-04-15

## 1. Role In Game

**MPL = "Modify Palette List"** — palette-swap table for sprite color variants
(damage flash, team color, boss-form transformation, etc.).

Confirmed via class names in `libgameDSO.so`:
- `CGxMPL::ChangePalette(name, len, pzd_mgr, idx)` — apply palette swap
- `CGxMPLParser::Open()` — parse the file
- `CGxMPLParser::GetChangePalette(i, j)` — get specific palette change
- `CGxMPLParser::GetChangeAllPalette(i)` — get full palette
- `CGxMPLParser::DeleteCHPAL(tagChangePalette**)` — `tagChangePalette` struct disposal

Loaded via `GsLoadPzxPartMPL(pzx_path, mpl_path, tagPZxType, ...)` paired with PZX
sprite asset; attached via `CGxPZxMgr::SetMPLSource` and `SetMPLPalette(idx)` to switch
between palette variants at runtime.

## 2. File Set

- `assets/boss/*.mpl` (25 files)
- `assets/stage/*.mpl` (25 files)
- 50 files total, sizes 2..575 bytes
- Names match sibling PZX assets: e.g. `nom_3_rot.mpl` ↔ PZX `nom_3_rot`.

## 3. Loader Path

- `GsLoadPzxPartMPL(pzx_path, mpl_path, tagPZxType, ...)` at `0x61145` (220 bytes)
  - Loads the PZX first, then attaches MPL via `SetMPLSource`
- `CGxEffectPZDMgr::SetMPLSource` (0x114289)
- `CGxPZxMgr::SetMPLSource` (0x11bfc9)
- `CGxPZxMgr::SetMPLPalette` (0x11bfe1)
- `CGxEffectPZD::SetMPLPalette` (0x12002d)
- `CGxZeroEffectPZD::SetMPLPalette` (0x121095)

## 4. Binary Structure (CONFIRMED)

```
file:
  u8   magic                  (high nibble selects entry-size variant)
  u8   record_count           (0..N; 0 = empty MPL — sprite has no palette variants)
  u32 × record_count   record_offset[i]   (file-absolute byte offsets)
  records × record_count

record (palette variant):
  u8   entry_count            (palette size; number of colors)
  entry × entry_count         (each entry = u16 RGB565 for magic=0x30, 3 bytes for magic=0x20)
```

Magic byte high-nibble dispatch (from `CGxMPLParser::GetChangeAllPalette` 0x114e54):
- `(magic >> 4) - 2`:
  - `1` (magic = 0x30) — **standard**: `u8 count + u32×count offsets + records (u8 entry_count + u16×entry_count RGB565)`. 89/91 files.
  - `2` (magic = 0x40) — **keyed**: `u16 count + u16×count key_table + u32×count offsets + records`. `fiver.mpl` only.
  - `3` (magic = 0x50) — **keyed**: same layout as 0x40. `scoreui.mpl` only.

For 0x40/0x50, keys can be non-sequential (e.g. scoreui keys are `[0..9, 17, 27..32]`),
suggesting they are meaningful palette/icon indices. Per-record internal layout differs
from 0x30 (first byte of record is not entry_count; e.g. fiver record 0 = `02 03 65 29 cb 5a 75 ad 03 00 00 65 29 e3 18` — 15 bytes); needs further per-call-site decode.

The first u16 of each record is almost always `0xf81f` — the **RGB565 magenta key color**
used as transparent index in classic 2D sprite palettes.

So `record_size = 1 + 2*entry_count`. **Validated on 50/50 files** (`inspect-mpl.py`):
record sizes always satisfy `(rsz - 1) / 2 == leading_byte`, and records within a file
always share the same entry_count.

Examples:
- `script_object.mpl` (2B): `30 00` — count=0 (no records)
- `wall.mpl` (11B): 1 record × (1 + 2×2) = 5 bytes → record `02 1f f8 ff ff` (2 u16s)
- `non_12.mpl` (117B): 5 records × 19 bytes (entry_count=9 each)
- `b_p_boss.mpl` (334B): 4 records × 79 bytes (entry_count=39 each)
- `b_silkworm_boss.mpl`: 2 records × 69 bytes (entry_count=34)
- `map_1.mpl`: 3 records × 87 bytes (entry_count=43)

The first u16 entry of every record is typically `0xf81f` (observed in nearly every file)
— possibly a header marker or "skip until next motion" sentinel. The trailing u16s
encode high-entropy packed data (palette indices? motion deltas? — TBD).

## 5. Open Questions

1. ~~u16 entry semantics~~ **DONE** — RGB565 colors.
2. Repeated trailing patterns across records of the same file: explained by sprites
   sharing a base palette across all variants (only some indices differ).
3. ~~`fiver.mpl` magic `0x40`~~ **EXPLAINED** — different magic variant with u16 count.
4. ~~Cross-correlate entry_count with PZX frame_count~~ **N/A** — entry_count = palette
   color count (independent of frame count).
5. Confirm `tagChangePalette` runtime struct layout (ChangePalette body size 0xc bytes).

## 6. Tooling

- inspect: `scripts/formats/mpl/00_inspect/inspect-mpl.py` ✓ — full record-table dump,
  validates `record_size = 1 + 2*entry_count` invariant.
- parse: `scripts/formats/mpl/20_parse/parse-mpl.py` ✓ — extracts records with RGB565
  decoding helpers (`rgb565_to_rgb888`).
- export: `scripts/formats/mpl/30_export/export-mpl-json.py` ✓ — **91/91 files exported**:
  89 standard (0x30) with full RGB565→RGB888 decoding, 2 keyed (0x40/0x50) with
  header+key+offset table fully decoded and per-record raw bytes preserved.

## 7. Next Steps

Keyed variants (0x40/0x50) per-record internal layout — partial trace from
`CGxMPLParser::GetChangePalette` (`0x114fd1`, 598 B):

```
GetChangePalette(this, key, count_arg):
  if type <= 1: return null         # only handles 0x40/0x50
  count = parser+0x18 (u16)         # key count
  keys = parser+0x14 (u16 array)
  # linear search keys[i] == key, get idx
  seek_record(parser, idx)
  result = alloc(tagChangePalette = 12 bytes)
  result+0xa = 1                    # valid flag

  read 1 byte → entry_count          # first byte of record
  if magic high-nibble == 4 (0x40) OR == 0:
     goto branch_A (different decode)
  if magic high-nibble == 5 (0x50):
     loop reading entries...
```

So the keyed-variant record is a **palette-change descriptor**, not a flat
palette. The first byte is an entry count; then a series of (color_index,
new_color) or similar tuples. Per-tuple size is approximately 5 bytes (matches
the `entry*5 + 4` allocation pattern in the loop body).

For now, the JSON exporter preserves keyed-record bytes raw (`raw_hex` field)
so consumers can re-decode once the per-tuple shape is fully nailed. The
recreation engine can call into the same `GetChangePalette` semantics directly
on the raw bytes.
