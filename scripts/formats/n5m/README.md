# N5M Scripts

- `00_inspect/`
  - `inspect-n5m.py`: basic header dump, sibling `N5S` tail offsets, candidate block starts
- `10_probe/`
  - `probe-n5m-block-prefixes.py`: summarize repeated block prefixes using sibling `N5S` offsets
  - `probe-n5m-block-header.py`: older fixed `0x11` header probe kept for byte-history comparison
  - `probe-n5m-layer-groups.py`: stronger variable-prefix probe (`u16, u16, flags[7], group_count, counted groups of (u8, u8, i16, i16)`)
  - `align-n5m-to-loadmap-prefix.py`: show how `block_start` bytes map onto the early `LoadMap` read sequence
  - `summarize-n5m-header-fields.py`: summarize `header_a/header_b`, `g0` pairs, and flag variability per stage
  - `probe-n5m-body-prefixes.py`: summarize the first 16 bytes at `post_groups_start`
  - `cluster-n5m-body-families.py`: cluster blocks by shared `post_groups_start` prefix families
  - `compare-n5m-family-pair.py`: compare two N5M files block-by-block at `post_groups_start`
  - `probe-n5m-strong-family-record0.py`: parse the first recovered post-group record for strong shared families
  - `probe-n5m-strong-family-sections.py`: parse the first recovered land/path section for strong shared families
  - `probe-n5m-strong-family-next-section.py`: test a candidate grammar immediately after the recovered strong-family section
- `20_parse/`
  - reserved for a future exact body parser
