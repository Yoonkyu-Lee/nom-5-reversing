"""
cluster-n5m-body-families.py

Cluster N5M repeated blocks by the first body bytes at `post_groups_start`.
This is a lightweight family detector to guide the next exact body parser step.
"""

from __future__ import annotations

import collections
import importlib.util
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parents[4]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from scripts.formats.n5s._frontmatter import parse_frontmatter

PROBE_PATH = pathlib.Path(__file__).with_name("probe-n5m-layer-groups.py")
PROBE_SPEC = importlib.util.spec_from_file_location("probe_n5m_layer_groups", PROBE_PATH)
if PROBE_SPEC is None or PROBE_SPEC.loader is None:
    raise RuntimeError(f"failed to load helper module from {PROBE_PATH}")
PROBE = importlib.util.module_from_spec(PROBE_SPEC)
PROBE_SPEC.loader.exec_module(PROBE)

parse_block_layer_groups = PROBE.parse_block_layer_groups
sibling_n5s_for = PROBE.sibling_n5s_for

MAP_DIR = pathlib.Path("jadx-out/nom5/resources/assets/map")


def main() -> None:
    families: dict[str, list[dict]] = collections.defaultdict(list)

    for n5m_path in sorted(MAP_DIR.glob("*.n5m")):
        sib = sibling_n5s_for(n5m_path)
        if sib is None:
            continue
        data = n5m_path.read_bytes()
        tail = parse_frontmatter(sib.read_bytes())["tail_u16"]
        ends = tail[1:] + [len(data)]
        for block_index, (start, end) in enumerate(zip(tail, ends)):
            info = parse_block_layer_groups(data, start, end)
            body_start = info["post_groups_start"]
            family = data[body_start:body_start + 16].hex(" ")
            g0 = None
            if info["groups"] and info["groups"][0]["elements"]:
                first = info["groups"][0]["elements"][0]
                g0 = (first["a"], first["b"], first["x"], first["y"])
            families[family].append(
                {
                    "file": n5m_path.name,
                    "block_index": block_index,
                    "start": start,
                    "post_groups_start": body_start,
                    "header_a": info["header_a"],
                    "header_b": info["header_b"],
                    "flags": tuple(info["flags"]),
                    "g0": g0,
                }
            )

    sorted_families = sorted(families.items(), key=lambda kv: (-len(kv[1]), kv[0]))
    print(f"body families: {len(sorted_families)}")
    for i, (family, rows) in enumerate(sorted_families[:12], start=1):
        files = []
        g0s = []
        a_vals = []
        flag_count = len({row["flags"] for row in rows})
        for row in rows:
            if row["file"] not in files:
                files.append(row["file"])
            if row["g0"] not in g0s:
                g0s.append(row["g0"])
            if row["header_a"] not in a_vals:
                a_vals.append(row["header_a"])
        print(f"\n[{i:02d}] count={len(rows)} files={len(files)}")
        print(f"  prefix={family}")
        print(f"  files={files[:8]}")
        print(f"  g0={g0s}")
        print(f"  header_a={[hex(v) for v in a_vals]}")
        print(f"  flag_variants={flag_count}")
        for row in rows[:4]:
            print(
                f"    {row['file']} block={row['block_index']} "
                f"start={row['start']:#06x} post={row['post_groups_start']:#06x} "
                f"g0={row['g0']} flags={row['flags']}"
            )


if __name__ == "__main__":
    main()
