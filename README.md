# luafontmanager

A Lua module to provide access to the system font catalog.

## Platforms
* Mac OS X and Linux supported via [fontconfig](http://www.freedesktop.org/software/fontconfig)
* (_TODO_) Windows 7 and later supported via [DirectWrite](http://msdn.microsoft.com/en-us/library/windows/desktop/dd368038(v=vs.85).aspx)

## Installing

### Installing fontconfig dependency

On most Linux desktop systems, fontconfig should be installed by default. On OS X, fontconfig can be installed using Homebrew

```
brew install fontconfig
```

### Installing luafontmanager

```
luarocks install luafontmanager
```

## Documentation
* [API Docs](https://deepakjois.github.io/luafontmanager/)

## Usage

```lua
local fm = require("fontmanager")
local spt = require("serpent") -- luarocks install serpent

print(spt.block(fm.get_installed_fonts(), {comment = false}))

-- This will print a list which looks like:
--
-- {
-- …<snip>…
--   {
--     name = "IowanOldStyle-BlackItalic",
--     path = "/Library/Fonts/Iowan Old Style.ttc"
--   },
--   {
--     name = "ChalkboardSE-Bold",
--     path = "/Library/Fonts/ChalkboardSE.ttc"
--   },
--   {
--     name = "DiwanMishafi",
--     path = "/Library/Fonts/Mishafi.ttf"
--   },
-- …<snip>…
-- }
```

## Credits
* [lltxplatform](https://github.com/phst/lltxplatform)
* [font-manager](https://github.com/devongovett/font-manager)
