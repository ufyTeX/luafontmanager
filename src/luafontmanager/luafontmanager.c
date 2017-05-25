#include "luafontmanager.h"


#include <stdlib.h>
#include <limits.h>

#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

int get_installed_fonts(lua_State *L) {
  struct fontinfo *fonts = NULL;
  unsigned int count = 0;
  int results = 0;
  if (get_installed_fonts_impl(&fonts, &count) == 0 && count < INT_MAX) {
    unsigned int i;
    lua_createtable(L, (signed int) count, 0);
    for (i = 0; i < count; ++i) {
      const struct fontinfo *const info = &fonts[i];
      lua_createtable(L, 0, (info->name != NULL) + (info->path != NULL));
      if (info->name != NULL) {
        lua_pushstring(L, "name");
        lua_pushstring(L, info->name);
        free(info->name);
        lua_rawset(L, -3);
      }
      if (info->path != NULL) {
        lua_pushstring(L, "path");
        lua_pushstring(L, info->path);
        free(info->path);
        lua_rawset(L, -3);
      }
      lua_rawseti(L, -2, (signed int) i + 1);
    }
    results = 1;
  }
  if (fonts != NULL) {
    free(fonts);
  }
  return results;
}

static const struct luaL_Reg lib_table [] = {
  {"get_installed_fonts", get_installed_fonts},
  {NULL, NULL}
};

int luaopen_luafontmanager (lua_State *L) {
  lua_newtable(L);
  luaL_setfuncs(L, lib_table,0);

  return 1;
}

