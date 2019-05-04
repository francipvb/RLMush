#include "stdafx.h"
#include "lua.hpp"
#include "luatolk.h"

#include "tolk.h"
#include "util.h"

using namespace std;

int luatolk_DetectScreenReader(lua_State* L)
{
	bool success = false;
	const wchar_t* screenReaderSTR = Tolk_DetectScreenReader();
	char* retStr = FromWideChar(screenReaderSTR);

	if (retStr)
	{
		success = true;
		lua_pushstring(L, retStr);
	}

	delete retStr;

	if (success) {
		return 1;
	}

	return 0;
}

int luatolk_IsLoaded(lua_State* L)
{
	lua_pushboolean(L, ToLuaBoolean(Tolk_IsLoaded()));
	return 1;
}

int luatolk_HasBraille(lua_State* L)
{
	lua_pushboolean(L, ToLuaBoolean(Tolk_HasBraille()));
	return 1;
}

int luatolk_HasSpeech(lua_State* L)
{
	lua_pushboolean(L, ToLuaBoolean(Tolk_HasSpeech()));
	return 1;
}
