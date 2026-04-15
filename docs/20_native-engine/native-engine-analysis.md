# NOM5 Native Engine Analysis

- Date: 2026-04-14
- Source: `libgameDSO.so` (armeabi, 1,753,495 bytes)
- Tools: ELF section parsing, string extraction, symbol demangling (`scripts/engine/dump-so-strings.py`, `scripts/engine/analyze-so-symbols.py`)

## Key Numbers

- ELF: 32-bit ARM LE, entry `0x54a10`
- `.text` section: 850,816 bytes (core engine code)
- `.symtab`: 14,869 entries → 5,215 unique named functions
- C++ classes: 258
- JNI exports: 13

## JNI Interface (Java ↔ Native)

### Java → Native (exported from .so)

| Function | Address | Notes |
|---|---|---|
| `InitializeJNIGlobalRef` | 0x54a75 | Sets up JNI class/method refs |
| `NativeInitWithBufferSize(int,int)` | 0x54c5d | Init engine with screen buffer |
| `NativeInitDeviceInfo(int,int)` | 0x54eed | Pass device width/height |
| `NativeResize(int,int)` | 0x553c1 | Handle screen resize |
| `NativeRender()` | 0x55c91 | Main render call (called every frame) |
| `handleCletEvent(int,int,int,int)` | 0x54bf5 | Touch/key input |
| `NativeResumeClet()` | 0x54be5 | App resume |
| `NativePauseClet()` | 0x54bed | App pause |
| `NativeDestroyClet()` | 0x54ce9 | Destroy engine |
| `NativeIsNexusOne(boolean)` | 0x54aa9 | Device hint (screen size) |
| `NativeNetTimeOut()` | 0x54aa5 | Network timeout callback |
| `NativeAsyncTimerCallBack(int)` | 0x54bd9 | Async timer fire |
| `NativeResponseIAP(String,int)` | 0x54ac1 | IAP result callback |

### Native → Java (callbacks via JNI)

The native engine calls back to `Natives.java` static methods:

- `GWSwapBuffers()` — swap GL buffers (called from render loop)
- `OnUIStatusChange(int)` — scene transitions (title=0, game=1, etc.)
- `OnSoundPlay(int, int, boolean)` — play a sound asset
- `OnStopSound()` — stop all sounds
- `OnVibrate(int)` — vibrate for N ms
- `OnEvent(int)` — misc UI events
- `OnAsyncTimerSet(int, int)` — schedule a callback
- `readAssete(String)→byte[]` — load asset file by name
- `isAssetExist(String)→int` — check asset existence
- `saveFile(String, byte[])` / `loadFile(String)→byte[]` — save data persistence
- `getAbsolueFilePath()→String` — app files directory
- `getPhoneNumber()→byte[]` — used for LGU billing (can stub → dummy)
- `getPhoneModel()→byte[]` — device model string
- `getNetState()→int` — billing socket state
- `netConnect()→int` — billing connect
- `netBillcomSocketConnect(String,int)→int` — TCP connect via LGU socket
- `netBillcomSocketWrite(byte[])→int` — send data
- `netBillcomSocketRead(int)→byte[]` — receive data
- `changeUIStatus(int)` — show/hide UI overlays
- `SetSpeed(int)` — set FPS target
- `getVersion()→String`
- `showLoadingDialog()` / `hideLoadingDialog()`
- `showTitleComponent()` / `hideTitleComponent()`
- `getGLOptionLinear()→int`
- `requestIAP(int, String, byte[])` — trigger IAP (can stub → no-op)

## C++ Class Hierarchy (key classes)

### Game Scenes (lifecycle)

```
CGsLogo / CGsLogo2010     — Gamevil splash
CN5TitleScene             — title screen
CN5MenuScene (80 methods) — main menu
CN5GameSelectScene (38)   — stage/char select
CStageGameScene (39)      — main gameplay loop
CBossGameBase (19)        — boss base
  CBossScene_GreedKing (17)
  CBossScene_Plate (17)
  CBossScene_Rival (34)
  CBossScene_Silkworm (19)
  CBossScene_Snake (22)
  CBossScene_SpaceGod (15)
CScriptScene (20)         — cutscene player
```

### Player Character

```
CNom (77 methods)         — base "놈" character
  CNom_Beat               — beat/music stage
  CNom_Bounce             — bounce stage
  CNom_Bridle             — bridle stage
  CNom_Decal
  CNom_Earth
  CNom_Gate
  CNom_Gravity            — gravity-flip stage
  CNom_GreedKing          — GreedKing boss stage
  CNom_Illusion
  CNom_Path
  CNom_Plate
  CNom_Shoting            — shooting stage
  CNom_Silkworm
  CNom_Snake
  CNom_SpaceGod
CNomUI (66 methods)       — HUD/input
```

### Boss AI (FSM-based)

```
CFsmManager (12)          — FSM dispatcher
CGsAutomata (16)          — FSM base
CBoss_SpaceGod (31)       — DoFSM_BOSS_SPACEGOD_PUNCH/FINGER/TOSS/SHRINK
CBoss_GreedKing (24)
CBoss_Plate (16)
CBoss_Rival_Alien (35)    — most complex boss
CBoss_Silkworm (21)
CSnake (29)               — snake boss (not prefixed CBoss_)
```

### Graphics / Sprite Engine

```
CGsGraphics (38)          — top-level GL surface
CDrawMgr (36)             — draw calls: FadeOut, Blur, Rotate, String, Number
CQRDrawMgr (41)           — high-quality renderer variant
CGxPZxMgr (17)            — PZX container manager
CGxPZxFrame (24)          — single PZX frame
CGxPZxAni (25)            — animation sequence
CGxPZxBitmap              — bitmap data
  CGxPZxDIB8 (8)          — 8-bit paletted
  CGxPZxDIB16 (1)         — 16-bit (likely RGB565)
CPzxMgr (10)              — higher-level PZX manager
  CPzxSingleBitmap (27)
  CPzxDoubleBitmap (40)
  CPzxUncompressBitmap
  CPzxFillterBitmap (4)
CAniObject (30)           — animated sprite object
CAniObjectMgr (4)
```

### Asset Format Parsers

```
CGxPZxParserBase          — PZX base parser
CGxPZFParser (14)         — PZF (particle effect frames)
CGxPZDParser (7)          — PZD (2D effect?)
CGxMPLParser (5)          — MPL (animation path/motion)
CGxPZAParser (4)          — PZA (?)
CGxBFontParser (2)        — BFont parser
CScriptEngine (34)        — .scr bytecode interpreter
```

### Map / Stage

```
CMapMgr (31)              — overall map manager
CMap (18)                 — base map
  CMap_Beat / CMap_Bounce / CMap_Bridle
  CMap_Earth / CMap_Gravity / CMap_Illusion
  CMap_J / CMap_Path / CMap_T
CBackLayer (5)            — scrolling background
  CBackLayer_Bridle / _Decal / _Gate / _Illusion
  CBackLayer_Object / _Pattern / _Shoting
CLandLayer (8)            — collision/landing layer
CPathLayer (5)            — path/rail layer
```

### Systems

```
CGsNetCore (24)           — network (billing TCP)
CNet (59)                 — lower-level network
CGsCertification (47)     — LGU+ ARM auth
CSaveDataMgr (78)         — save game
CGsSound (21)             — audio
CGsParticleMgr (14)       — particle system
CGsEmitter (11)
CInputStream / COutputStream — asset I/O
CGsEncryptFile (11)       — encrypted save data
CGsPhoneInfo (4)          — phone info (IMEI etc.)
```

## Asset Formats Used

| Extension | Class | Description |
|---|---|---|
| `.pzx` | `CGxPZxMgr` / `CPzxMgr` | Sprite container (frames + animations) |
| `.mpl` | `CGxMPL` | Motion path / animation |
| `.zt1` | (table loader) | zlib-compressed data table (8-byte header) |
| `.n5s` | `CMap*` | Stage data |
| `.n5m` | `CMapMgr*` | Map data |
| `.scr` | `CScriptEngine` | Binary script (opcode + EUC-KR text) |
| `.ft2` | `CGxBFont` | Bitmap font (FT2 = FreeType2?) |
| `.pzf` | `CGxPZFParser` | Particle/effect frame |
| `.pzd` | `CGxPZDParser` | 2D effect |

## Stage Types (10 gameplay modes)

1. **Beat** — rhythm-based
2. **Bounce** — bouncing physics
3. **Bridle** — constrained movement
4. **Earth** — earth/gravity stage
5. **Gate** — gate passage
6. **Gravity** — gravity flip
7. **Illusion** — illusion/mirror
8. **Path** — rail/path riding
9. **Shoting** — shooting (shmup-like)
10. **Decal** — decoration/special

## Network URL Found

`http://www.gamevil.com/GAME/index.php?m=2&mk=10&pk=272`

This is the ranking/server endpoint. All network calls go through `CNet` → `CGsNetCore` → LGU billing socket (`IBillSocket`).

## Re-development Implications

### What can be stubbed / mocked (minimal effort)

- All LGU billing/auth (`CNet`, `CGsCertification`, `CGsNetCore`) → return success/empty
- `getPhoneNumber()` → return dummy "01012341234"
- `requestIAP()` → no-op
- `getNetState()` / `netConnect()` → return 1 (connected)

### What needs re-implementation

- **Graphics layer**: OpenGL ES 1.x draw calls (already in `CDrawMgr` / `CGsGraphics`)
- **Asset loading**: `readAssete()` via Android assets → file system read
- **Input**: `handleCletEvent()` touch mapping
- **Sound**: `OnSoundPlay()` → audio backend
- **Save/load**: file I/O

### Shortest path to running on modern Android / PC

Option A — **Android repackage** (armeabi → arm64-v8a recompile):
- Requires source or full decompilation of libgameDSO.so

Option B — **Userspace ARM emulation** (qemu-arm-static on Linux):
- Run the ARM .so directly on x86 Linux via qemu
- Wrap Android JNI layer with a thin native harness
- Technically feasible, complex to set up

Option C — **Game engine rewrite** (recommended long-term):
- Decode all assets to standard formats (PNG, JSON, etc.)
- Re-implement 5,215-function engine from symbol names + behavior observation
- Target platform: SDL2/Raylib (C++) or Godot Engine (GDScript)
- Use the 258 C++ class names as the blueprint

### Recommended next steps

1. **PZX decoder** — extract all sprites to PNG (most impactful)
2. **SCR decoder** — extract all dialog/story text
3. **ZT1 decoder** — extract all numeric tables (stats, item data)
4. **N5S/N5M decoder** — understand level layout
5. **Architecture design** — choose target platform, start engine skeleton
