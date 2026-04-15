"""
export-mpl-json.py

Export every NOM5 MPL file to JSON with decoded RGB565 colors.

Output structure per file:
{
  "source_file": "wall.mpl",
  "magic": 48,
  "variant": "0x30_standard",
  "record_count": 1,
  "records": [
    {
      "record_index": 0,
      "entry_count": 2,
      "palette": [
        {"index": 0, "rgb565": "0xf81f", "rgb888": [248, 0, 248], "transparent": true},
        {"index": 1, "rgb565": "0xffff", "rgb888": [255, 255, 255], "transparent": false}
      ]
    }
  ]
}
"""

from __future__ import annotations

import json
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[4]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

# Import parse-mpl by file path (hyphenated module name)
import importlib.util
PARSE_PATH = ROOT / "scripts/formats/mpl/20_parse/parse-mpl.py"
_SPEC = importlib.util.spec_from_file_location("_mpl_parse", PARSE_PATH)
assert _SPEC is not None and _SPEC.loader is not None
_M = importlib.util.module_from_spec(_SPEC)
_SPEC.loader.exec_module(_M)  # type: ignore[attr-defined]
parse_mpl = _M.parse_mpl
rgb565_to_rgb888 = _M.rgb565_to_rgb888

ASSETS = ROOT / "jadx-out/nom5/resources/assets"
OUT_DIR = ROOT / "out/mpl-json"


def export_one(path: pathlib.Path) -> dict:
    data = path.read_bytes()
    parsed = parse_mpl(data)
    doc = {
        "source_file": str(path.relative_to(ASSETS)).replace("\\", "/"),
        "size": len(data),
        "magic": parsed["magic"],
        "variant": parsed["variant"],
        "skipped": parsed["skipped"],
    }
    if parsed["skipped"]:
        doc["records"] = []
        return doc
    doc["record_count"] = parsed["record_count"]
    if parsed.get("keys") is not None:
        doc["keys"] = parsed["keys"]
    out_records = []
    is_keyed = parsed["magic"] in (0x40, 0x50)
    for rec in parsed["records"]:
        out = {
            "record_index": rec["record_index"],
            "entry_count": rec["entry_count"],
        }
        if "key" in rec:
            out["key"] = rec["key"]
        if is_keyed:
            # 0x40/0x50: palette layout per-record TBD; preserve raw payload
            out["size"] = rec["size"]
            out["raw_hex"] = rec["raw_hex"]
        else:
            palette = []
            for j, c in enumerate(rec["rgb565"]):
                r, g, b = rgb565_to_rgb888(c)
                palette.append({
                    "index": j,
                    "rgb565": f"0x{c:04x}",
                    "rgb888": [r, g, b],
                    "transparent": c == 0xF81F,
                })
            out["palette"] = palette
        out_records.append(out)
    doc["records"] = out_records
    return doc


def main() -> None:
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    files = sorted(ASSETS.rglob("*.mpl"))
    ok = fail = skipped = 0
    for p in files:
        try:
            doc = export_one(p)
            out = OUT_DIR / (str(p.relative_to(ASSETS)).replace("/", "_").replace("\\", "_") + ".json")
            out.write_text(json.dumps(doc, ensure_ascii=False, indent=2), encoding="utf-8")
            if doc["skipped"]:
                skipped += 1
                print(f"  SKIP {p.name} (variant {doc['variant']})")
            else:
                ok += 1
        except Exception as e:
            fail += 1
            print(f"  FAIL {p.name}: {e}")
    print(f"\n{ok} ok, {skipped} skipped (extended variant), {fail} failed → {OUT_DIR}")


if __name__ == "__main__":
    main()
