-----------
-- Lua module to provide access to the system font catalog.
--
-- * [Source on Github](https://github.com/deepakjois/luafontmanager)
--
-- @author Deepak Jois <<deepak.jois@gmail.com>>
-- @copyright 2017
-- @license MIT
-- @module fontmanager
local lf = require("luafontmanager")

--- Returns all the fonts installed on the system.
--
-- @return A table containing an entry for each font. Each entry is a
-- table containing a `name` field and a `path` field.
--
-- @function fontmanager.get_installed_fonts

return lf
