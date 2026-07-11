# WD2 ScriptHook Analysis

Reverse engineering and analysis of Watch Dogs 2 ScriptHook (r185).

## Binaries

| File | Size | Description |
|------|------|-------------|
| `core.dll` | 1.4 MB | Main ScriptHook DLL with Lua VM and game hooks |
| `skia.dll` | 7.8 MB | Skia graphics library for text rendering |
| `dinput8.dll` | 20 KB | DLL proxy injector |
| `crashpad_handler.exe` | 588 KB | Crash handler |

## Analysis Goals

1. Identify exported functions in core.dll
2. Map Lua C API functions (lua_pushstring, lua_register, etc.)
3. Find game native function hooks
4. Document ScriptHook Lua API bindings
5. Understand Scripting Engine interaction

## Tools

- Ghidra (NSA disassembler)
- IDA Free
- x64dbg
- PE-bear

## License

This repository is for educational and modding research purposes only.
