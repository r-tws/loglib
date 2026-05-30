example
```lua
local loglib = loadstring(game:HttpGet("https://raw.githubusercontent.com/r-tws/loglib/refs/heads/main/v2.lua"))()

loglib:print("loaded", loglib.Colors.green)
loglib:print("loaded", loglib.Colors.green, time)
loglib:print("ctest", loglib.Colors.cyan)
loglib:print("ctest", loglib.Colors.green)
loglib:print("willy", loglib.Colors.yellow)
loglib:print("willy", loglib.Colors.yellow, time)
loglib:print("no", loglib.Colors.red)
loglib:print("bye", loglib.Colors.white)
```
