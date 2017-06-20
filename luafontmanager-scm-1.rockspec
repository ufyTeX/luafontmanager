package = "luafontmanager"
version = "scm-1"
source = {
  url = "git+https://github.com/deepakjois/luafontmanager"
}
description = {
  summary = "A Lua module to access the system font catalog",
  homepage = "https://github.com/deepakjois/luafontmanager",
  license = "MIT"
}
dependencies = {
  "lua >= 5.2, < 5.4"
}
external_dependencies = {
  FONTCONFIG = {
    header = "fontconfig/fontconfig.h"
  }
}
supported_platforms = { "linux", "macosx"}
build = {
  type = "builtin",
  modules = {
    fontmanager = "src/fontmanager.lua",
    luafontmanager = {
      sources = { "src/luafontmanager/luafontmanager.c", "src/luafontmanager/fonts_fontconfig.c" },
      libraries = { "fontconfig"},
      incdirs = { "$(FONTCONFIG_INCDIR)/fontconfig" },
      libdirs = { "$(FONTCONFIG_LIBDIR)" }
    }
  },
}
