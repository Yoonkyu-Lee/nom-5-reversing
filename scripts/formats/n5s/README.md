# N5S Scripts

- `00_inspect/`: raw dump와 초기 관찰
- `10_probe/`: front-matter / offset / section 경계 추적
  - `probe-n5s-frontmatter.py`: exact front-matter 구조 확인
  - `analyze-n5s-record-fields.py`: 0x34 record field 분포 요약
  - `compare-n5s-tail-to-n5m.py`: trailing u16 table과 sibling N5M 크기 비교
- `20_parse/`: 구조 파서
