"""
Shared helpers for NOM5 N5S probing/parsing scripts.
"""

from __future__ import annotations

import struct

DEFAULT_NORMAL_START = 96
DEFAULT_BOSS_START = 106
TILE_DIM_MIN = 64
TILE_DIM_MAX = 512


def u16le(data: bytes, off: int) -> int:
    if off + 2 > len(data):
        return -1
    return struct.unpack_from("<H", data, off)[0]


def marker_at(data: bytes) -> int:
    if len(data) < 11:
        return -1
    return u16le(data, 9)


def score_binary_start(data: bytes, off: int) -> float:
    """
    Score a binary-start candidate.

    Current loader facts used here:
    - CMap_J::LoadMap skips a map-manager supplied offset, not a hardcoded 96.
    - The first direct file reads after skip are:
      u16 tile_w, u16 tile_h, u8 flags[0..6].
    """
    if off + 11 > len(data):
        return -99.0

    w = u16le(data, off)
    h = u16le(data, off + 2)
    flags7 = data[off + 4:off + 11]

    score = 0.0
    if TILE_DIM_MIN <= w <= TILE_DIM_MAX:
        score += 2.0
    if TILE_DIM_MIN <= h <= TILE_DIM_MAX:
        score += 2.0
    if w == 0 or h == 0:
        score -= 3.0
    if w == h and w > 0:
        score -= 0.5
    if h == 256:
        score += 0.8
    if 240 <= w <= 320:
        score += 0.4

    high_flags = sum(1 for b in flags7 if b > 0x3F)
    score -= high_flags * 0.35

    if off > 0 and data[off - 1] in (0x00, 0xCD):
        score += 0.4

    return score


def find_binary_start(data: bytes) -> tuple[int, float]:
    """
    Best-effort binary section start guess for standalone file parsing.

    This is intentionally heuristic. Runtime uses CMapMgr::GetMapOffset(stage_id),
    so offline parsing should treat this as an estimate, not a loader truth.
    """
    marker = marker_at(data)
    if marker == 0xFFFF:
        lo, hi = 96, min(len(data), 140)
        best_off = DEFAULT_BOSS_START
    else:
        lo, hi = 88, min(len(data), 140)
        best_off = DEFAULT_NORMAL_START

    best_score = -99.0
    for off in range(lo, hi):
        s = score_binary_start(data, off)
        if s > best_score:
            best_score = s
            best_off = off
    return best_off, best_score
