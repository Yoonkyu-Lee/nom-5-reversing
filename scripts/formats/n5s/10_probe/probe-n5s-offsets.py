"""
probe-n5s-offsets.py
Inspect candidate body starts for N5S files.

Important:
- Runtime does not hardcode skip(96). It calls CMapMgr::GetMapOffset(stage_id).
- This script is therefore an offline estimator and inspection helper.
"""

from __future__ import annotations

import pathlib
import struct

from scripts.formats.n5s._common import find_binary_start

ASSETS = pathlib.Path("jadx-out/nom5/resources/assets")
MAP_DIR = ASSETS / "map"
OUT_DIR = pathlib.Path("out/n5s-analysis")
OUT_DIR.mkdir(parents=True, exist_ok=True)


def u16le(data: bytes, off: int) -> int:
    if off + 2 > len(data):
        return -1
    return struct.unpack_from("<H", data, off)[0]


def u32le(data: bytes, off: int) -> int:
    if off + 4 > len(data):
        return -1
    return struct.unpack_from("<I", data, off)[0]


def is_plausible_dimension(v: int) -> bool:
    return 8 <= v <= 4096


def score_offset(data: bytes, skip: int) -> float:
    pos = skip
    if pos + 4 > len(data):
        return 0.0
    v1 = u16le(data, pos)
    v2 = u16le(data, pos + 2)
    score = 0.0
    if is_plausible_dimension(v1):
        score += 1.0
    if is_plausible_dimension(v2):
        score += 1.0
    if v1 > 0 and v1 < 4096 and v2 > 0 and v2 < 4096:
        score += 0.5
    if v1 > 1024:
        score -= 1.0
    if v2 > 1024:
        score -= 1.0
    return score


def find_string_regions(data: bytes) -> list[tuple[int, int, str]]:
    results = []
    i = 0
    while i < len(data):
        if 0x20 <= data[i] <= 0x7E:
            j = i
            while j < len(data) and 0x20 <= data[j] <= 0x7E:
                j += 1
            if j < len(data) and data[j] == 0 and (j - i) >= 3:
                results.append((i, j + 1, data[i:j].decode("ascii")))
            i = j + 1
        else:
            i += 1
    return results


def analyze_probe(path: pathlib.Path) -> None:
    data = path.read_bytes()
    print(f"\n{'=' * 60}")
    print(f"{path.name} ({len(data)} bytes)")
    print(f"{'=' * 60}")

    print(f"Header[0..15]: {data[:16].hex(' ')}")
    print(f"  byte[0]={data[0]} byte[1]={data[1]}")
    print(f"  u32[0]={u32le(data, 0):#010x}  u32[4]={u32le(data, 4):#010x}  u32[8]={u32le(data, 8):#010x}")

    strings = find_string_regions(data)
    print(f"\nString regions ({len(strings)} total):")
    for start, end, s in strings[:15]:
        print(f"  [{start:#06x}..{end - 1:#06x}] '{s}'")
    if strings:
        last_str_end = max(e for _, e, _ in strings)
        print(f"  Last string ends at: {last_str_end:#06x} = {last_str_end}")
    else:
        last_str_end = 0

    print("\nCandidate skip offsets:")
    candidates = [0, 1, 4, 8, 9, 12, 16, 20, 24, 32, 48, 64, 96, 100, 106]
    b0 = data[0]
    derived = b0 * 4 + 1
    if derived not in candidates:
        candidates.append(derived)
    if last_str_end not in candidates:
        candidates.append(last_str_end)
    candidates.sort()

    best_score = -999.0
    best_skip = 0
    for skip in candidates:
        if skip >= len(data) - 4:
            continue
        v1 = u16le(data, skip)
        v2 = u16le(data, skip + 2)
        score = score_offset(data, skip)
        print(f"  skip={skip:4d}: u16[0]={v1:5d} (0x{v1:04x})  u16[2]={v2:5d} (0x{v2:04x})  score={score:.1f}")
        if score > best_score:
            best_score = score
            best_skip = skip

    auto_skip, auto_score = find_binary_start(data)
    print(f"\nBest local candidate: skip={best_skip}, score={best_score:.1f}")
    print(f"Shared heuristic pick: skip={auto_skip}, score={auto_score:.1f}")

    pos = auto_skip
    field_6e = u16le(data, pos)
    field_70 = u16le(data, pos + 2)
    flags7 = list(data[pos + 4:pos + 11])
    print(f"\nDetailed parse at skip={auto_skip}:")
    print(f"  tile_w = {field_6e} (0x{field_6e:04x})")
    print(f"  tile_h = {field_70} (0x{field_70:04x})")
    print(f"  flags7 = {[hex(f) for f in flags7]}")


def compare_all() -> None:
    n5s_files = sorted(MAP_DIR.glob("*.n5s"))

    print(f"\n{'=' * 80}")
    print("OFFSET TABLE HYPOTHESIS CHECK")
    print("Hypothesis: byte[0]=count, bytes[1..N]=u32 LE offsets")
    print(f"{'=' * 80}")
    print(f"{'file':<25} {'b0':>4} {'b1':>4} {'off0':>6} {'off1':>6} {'auto':>6} {'v@auto':>10} {'h@auto':>10}")
    for path in n5s_files:
        data = path.read_bytes()
        b0 = data[0]
        b1 = data[1]
        off0 = u32le(data, 1) if len(data) > 4 else -1
        off1 = u32le(data, 5) if len(data) > 8 else -1
        auto, _ = find_binary_start(data)
        v0 = u16le(data, auto)
        v2 = u16le(data, auto + 2)
        print(f"  {path.name:<25} {b0:>4} {b1:>4} {off0:>6} {off1:>6} {auto:>6} {v0:>10} {v2:>10}")


def main() -> None:
    import sys
    if len(sys.argv) > 1:
        analyze_probe(pathlib.Path(sys.argv[1]))
        return

    analyze_probe(MAP_DIR / 'stage_0.n5s')
    analyze_probe(MAP_DIR / 'stage_1.n5s')
    compare_all()


if __name__ == "__main__":
    main()
