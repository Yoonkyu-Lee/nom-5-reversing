# NOM5 Reverse Engineering Scripts

## Layout

- `build/`
  - APK rebuild helpers
- `engine/`
  - native symbol, string, disassembly helpers
- `formats/pzx/`
  - `00_inspect`, `10_probe`, `20_decode`, `90_native-support`
- `formats/scr/`
  - `00_inspect`, `10_probe`, `20_parse`, `30_export`
- `formats/n5s/`
  - `00_inspect`, `10_probe`, `20_parse`
- `formats/n5m/`
  - `00_inspect`, `10_probe`, `20_parse`
- `formats/mpl/`
  - `00_inspect`, `10_probe`, `20_parse`
- `formats/ft2/`
  - `00_inspect`, `10_probe`, `20_parse`

## Python rule

Run Python scripts with the workspace venv:

```powershell
.\.venv\Scripts\python.exe .\scripts\<path-to-script>.py
```
