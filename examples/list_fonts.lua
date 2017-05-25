local fm = require("fontmanager")
local spt = require("serpent") -- luarocks install serpent

print(spt.block(fm.get_installed_fonts(), {comment = false}))