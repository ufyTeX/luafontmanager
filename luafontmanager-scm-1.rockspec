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
  platforms = {
    linux = {
      FONTCONFIG = {
        header = "fontconfig/fontconfig.h"
      }
    }
  }
}
supported_platforms = { "linux", "macosx", "windows" }
build = {
  type = "builtin",
  modules = {
    fontmanager = "src/fontmanager.lua",
  },
  platforms = {
    linux = {
      modules = {
        luafontmanager = {
          sources = { "src/luafontmanager/luafontmanager.c", "src/luafontmanager/fonts_fontconfig.c" },
          libraries = { "fontconfig"},
          incdirs = { "$(FONTCONFIG_INCDIR)/fontconfig" },
          libdirs = { "$(FONTCONFIG_LIBDIR)" }
        }
      }
    },
    macosx = {
      type = "make",
      makefile = "Makefile.osx",
      build_variables = {
        CFLAGS="$(CFLAGS)",
        LIBFLAG="$(LIBFLAG)",
        LUA_LIBDIR="$(LUA_LIBDIR)",
        LUA_BINDIR="$(LUA_BINDIR)",
        LUA_INCDIR="$(LUA_INCDIR)",
        LUA="$(LUA)",
      },
      install_variables = {
        INST_PREFIX="$(PREFIX)",
        INST_BINDIR="$(BINDIR)",
        INST_LIBDIR="$(LIBDIR)",
        INST_LUADIR="$(LUADIR)",
        INST_CONFDIR="$(CONFDIR)",
      }
    }
  }
}
