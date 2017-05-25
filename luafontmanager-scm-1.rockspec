package = "luafontmanager"
version = "scm-1"
source = {
  url = "https://github.com/deepakjois/luafontmanager"
}
description = {
  summary = "A Lua module to access the system font catalog",
  homepage = "*** please enter a project homepage ***",
  license = "MIT"
}
dependencies = {
  "lua >= 5.2, < 5.4"
}
supported_platforms = { "linux", "macosx", "windows" }
build = {
  type = "builtin",
  modules = {
    fontmanager = "src/fontmanager.lua",
  },
  platforms = {
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
