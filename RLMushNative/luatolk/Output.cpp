#include "stdafx.h"
#include "luatolk.h"
#include "util.h"
#include "Tolk.h"

int luatolk_Output(lua_State* L)
{
	bool silence = false;

	if (!lua_isstring(L, 1))
	{
		return luaL_typerror(L, 1, "string");
	}

	const char* outputStr = lua_tostring(L, 1);
	silence = FromLuaBoolean(lua_toboolean(L, 2));

	// Call tolk
	wchar_t* outWstring = FromMultiByte(outputStr);
	const bool success = Tolk_Output(outWstring, silence);

	lua_pushboolean(L, ToLuaBoolean(success));

	delete outWstring;
	return 1;
}

int luatolk_Speak(lua_State* L)
{
	bool silence = false;

	if (!lua_isstring(L, 1))
	{
		return luaL_typerror(L, 1, "string");
	}

	const char* outputStr = lua_tostring(L, 1);
	silence = FromLuaBoolean(lua_toboolean(L, 2));

	// Call tolk
	wchar_t* outWstring = FromMultiByte(outputStr);
	const bool success = Tolk_Speak(outWstring, silence);

	lua_pushboolean(L, ToLuaBoolean(success));

	delete outWstring;
	return 1;
}

int luatolk_Braille(lua_State* L)
{
	if (!lua_isstring(L, 1))
	{
		return luaL_typerror(L, 1, "string");
	}

	const char* outputStr = lua_tostring(L, 1);

	// Call tolk
	wchar_t* outWstring = FromMultiByte(outputStr);
	const bool success = Tolk_Braille(outWstring);

	lua_pushboolean(L, ToLuaBoolean(success));

	delete outWstring;
	return 1;
}

int luatolk_Silence(lua_State* L)
{
	const bool succes = Tolk_Silence();
	lua_pushboolean(L, ToLuaBoolean(succes));
	return 1;
}

