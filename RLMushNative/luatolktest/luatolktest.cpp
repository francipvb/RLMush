#include "pch.h"

// LUA Header
#include "../luatolk/lua.hpp"

#include <iostream>

using namespace std;

int main()
{
	lua_State* L = luaL_newstate();
	const char* script =
		"require 'luatolk'\n"
		"\n"
		"luatolk.Load()\n"
		"print(luatolk.DetectScreenReader())\n"
		"luatolk.Speak('Probando', true)\n"
		"luatolk.Speak('Otra prueba')\n"
		"luatolk.Unload()\n";

	luaL_openlibs(L);
	luaL_dostring(L, script);
	lua_close(L);
}
