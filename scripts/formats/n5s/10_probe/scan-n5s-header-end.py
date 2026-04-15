"""
scan-n5s-header-end.py
Heuristically estimate the binary section start for each N5S file.

Important:
- Runtime does not hardcode skip(96). CMap_J::LoadMap calls
  CMapMgr::GetMapOffset(stage_id) and skips that returned value.
- This script therefore produces an offline estimate, not a loader truth.
"""

from __future__ import annotations

import pathlib
import struct
import sys

ROOT = pathlib.Path(__file__).resolve().parents[4]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from scripts.formats.n5s._common import find_binary_start

ASSETS = pathlib.Path("jadx-out/nom5/resources/assets")
MAP_DIR = ASSETS / "map"
OUT_DIR = pathlib.Path("out/n5s-analysis")
OUT_DIR.mkdir(parents=True, exist_ok=True)


def u16le(data: bytes, off: int) -> int:
    if off + 2 > len(data):
        return -1
    return struct.unpack_from("<H", data, off)[0]


def analyze_file(path: pathlib.Path, verbose: bool = False) -> dict:
    data = path.read_bytes()
    marker = struct.unpack_from("<H", data, 9)[0]

    best_off, best_sc = find_binary_start(data)
    w = u16le(data, best_off)
    h = u16le(data, best_off + 2)
    flags = list(data[best_off + 4: best_off + 13])

    result = {
        "name": path.name,
        "size": len(data),
        "marker": marker,
        "binary_start": best_off,
        "score": best_sc,
        "tile_w": w,
        "tile_h": h,
        "flags": flags,
    }

    if verbose:
        print(f"\n{'=' * 60}")
        print(f"{path.name} ({len(data)} bytes) marker={marker:#06x}")
        print(f"  Best binary start: offset {best_off} (score={best_sc:.1f})")
        print(f"  tile_w={w} tile_h={h} first7flags={[hex(f) for f in flags[:7]]}")
        print(f"  Byte before start: {data[best_off-1]:#04x}")

    return result


def main() -> None:
    import sys
    if len(sys.argv) > 1:
        analyze_file(pathlib.Path(sys.argv[1]), verbose=True)
        return

    n5s_files = sorted(MAP_DIR.glob("*.n5s"))
    print(f"Scanning {len(n5s_files)} N5S files for binary section start estimate")
    print(f"{'file':<20} {'marker':>8} {'offset':>7} {'score':>6} {'tile_w':>7} {'tile_h':>7}  flags7[:4]")
    print("-" * 75)

    results = []
    for path in n5s_files:
        r = analyze_file(path)
        results.append(r)
        flags_s = [hex(f) for f in r["flags"][:4]]
        print(f"  {r['name']:<20} {r['marker']:#06x}  {r['binary_start']:6d} {r['score']:6.1f}  "
              f"{r['tile_w']:6d}  {r['tile_h']:6d}  {flags_s}")

    # Save
    lines = ["file,marker,binary_start,score,tile_w,tile_h"]
    for r in results:
        lines.append(f"{r['name']},{r['marker']:#06x},{r['binary_start']},{r['score']:.1f},"
                     f"{r['tile_w']},{r['tile_h']}")
    out = OUT_DIR / "n5s-binary-start-offsets.csv"
    out.write_text("\n".join(lines), encoding="utf-8")
    print(f"\nSaved to {out}")


if __name__ == "__main__":
    main()
