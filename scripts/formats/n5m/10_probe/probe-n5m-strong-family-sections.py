"""
probe-n5m-strong-family-sections.py

Probe a stronger section grammar after `post_groups_start`, guided by the
annotated `CMap_J::LoadMap` sequence:

- u8 land_layer_count
- for each land layer:
  - u8 pattern_count_a
  - pattern_count_a * (u8 pzx_mgr, u8 frame, i16 x, i16 y)
  - u8 pattern_count_b
  - pattern_count_b * (u8 pzx_mgr, u8 frame, i16 x, i16 y)
  - u8 path_count
  - path_count *:
    - u16 node_count
    - node_count * (u8 dir, i16 x, i16 y, u16 aux)

This currently targets the strong shared families where the first recovered
record already matched cleanly.
"""

from __future__ import annotations

import importlib.util
import pathlib
import struct
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


def i16le(data: bytes, off: int) -> int:
    return struct.unpack_from("<h", data, off)[0]


def u16le(data: bytes, off: int) -> int:
    return struct.unpack_from("<H", data, off)[0]


def resolve_path(arg: str) -> pathlib.Path:
    path = pathlib.Path(arg)
    if path.exists():
        return path
    candidate = MAP_DIR / arg
    if candidate.exists():
        return candidate
    raise SystemExit(f"file not found: {arg}")


def parse_patterns(data: bytes, pos: int, end: int, count: int) -> tuple[list[dict], int]:
    rows = []
    for _ in range(count):
        if pos + 6 > end:
            raise ValueError("pattern overrun")
        rows.append(
            {
                "pzx_mgr": data[pos],
                "frame": data[pos + 1],
                "x": i16le(data, pos + 2),
                "y": i16le(data, pos + 4),
            }
        )
        pos += 6
    return rows, pos


def parse_paths(data: bytes, pos: int, end: int, count: int) -> tuple[list[dict], int]:
    paths = []
    for _ in range(count):
        if pos + 2 > end:
            raise ValueError("path header overrun")
        node_count = u16le(data, pos)
        pos += 2
        nodes = []
        for _ in range(node_count):
            if pos + 7 > end:
                raise ValueError("path node overrun")
            nodes.append(
                {
                    "dir": data[pos],
                    "x": i16le(data, pos + 1),
                    "y": i16le(data, pos + 3),
                    "aux": u16le(data, pos + 5),
                }
            )
            pos += 7
        paths.append({"node_count": node_count, "nodes": nodes})
    return paths, pos


def main() -> None:
    if len(sys.argv) < 2:
        raise SystemExit(
            "usage: probe-n5m-strong-family-sections.py <file.n5m> [block_index]"
        )

    n5m_path = resolve_path(sys.argv[1])
    block_index = int(sys.argv[2]) if len(sys.argv) > 2 else 0

    sib = sibling_n5s_for(n5m_path)
    if sib is None:
        raise SystemExit(f"no sibling N5S for {n5m_path.name}")

    data = n5m_path.read_bytes()
    tail = parse_frontmatter(sib.read_bytes())["tail_u16"]
    ends = tail[1:] + [len(data)]
    start = tail[block_index]
    end = ends[block_index]
    info = parse_block_layer_groups(data, start, end)
    pos = info["post_groups_start"]

    if pos >= end:
        raise SystemExit("empty post-group section")

    land_layer_count = data[pos]
    pos += 1
    layers = []
    for _ in range(land_layer_count):
        if pos >= end:
            raise ValueError("missing land layer body")
        count_a = data[pos]
        pos += 1
        patt_a, pos = parse_patterns(data, pos, end, count_a)

        if pos >= end:
            raise ValueError("missing secondary pattern count")
        count_b = data[pos]
        pos += 1
        patt_b, pos = parse_patterns(data, pos, end, count_b)

        if pos >= end:
            raise ValueError("missing path count")
        path_count = data[pos]
        pos += 1
        paths, pos = parse_paths(data, pos, end, path_count)

        layers.append(
            {
                "count_a": count_a,
                "patterns_a": patt_a,
                "count_b": count_b,
                "patterns_b": patt_b,
                "path_count": path_count,
                "paths": paths,
            }
        )

    print(f"=== {n5m_path.name} block {block_index} ===")
    print(f"start={start:#06x} post={info['post_groups_start']:#06x} end={end:#06x}")
    print(f"land_layer_count={land_layer_count}")
    for li, layer in enumerate(layers):
        print(
            f"[layer {li}] count_a={layer['count_a']} "
            f"count_b={layer['count_b']} path_count={layer['path_count']}"
        )
        for i, row in enumerate(layer["patterns_a"][:12]):
            print(
                f"  A[{i}] (mgr,frame,x,y)=({row['pzx_mgr']}, {row['frame']}, {row['x']}, {row['y']})"
            )
        for i, row in enumerate(layer["patterns_b"][:12]):
            print(
                f"  B[{i}] (mgr,frame,x,y)=({row['pzx_mgr']}, {row['frame']}, {row['x']}, {row['y']})"
            )
        for pi, path in enumerate(layer["paths"][:4]):
            print(f"  path[{pi}] node_count={path['node_count']}")
            for ni, node in enumerate(path["nodes"][:8]):
                print(
                    f"    node[{ni}] (dir,x,y,aux)=({node['dir']}, {node['x']}, {node['y']}, {node['aux']})"
                )
    print(f"consumed={pos - info['post_groups_start']} bytes")
    print(f"next16={data[pos:pos + 16].hex(' ')}")


if __name__ == "__main__":
    main()
