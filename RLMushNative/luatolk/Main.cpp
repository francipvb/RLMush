#include "stdafx.h"
#include "luatolk.h"
#include "lauxlib.h"
#include "tolk.h"

extern "C" __declspec(dllexport) int luaopen_luatolk(lua_State* L) {
	const luaL_reg funcList[] = {
		// Loading and unloading:
		// I tried to make automatically loadable and unloadable but I didn't found any way to load/unload automagically...
		{"Load", luatolk_Load},
		{"Unload", luatolk_Unload},

		// Obtaining information:
		{"DetectScreenReader", luatolk_DetectScreenReader},
		{"IsLoaded", luatolk_IsLoaded},
		{"HasBraille", luatolk_HasBraille},
		{"HasSpeech", luatolk_HasSpeech},

		// Output functions
	{"Output", luatolk_Output},
	{"Speak", luatolk_Speak},
	{"Braille", luatolk_Braille},
	{"Silence", luatolk_Braille},

		{NULL, NULL}
	};
	luaL_register(L, "luatolk", funcList);

	return 1;
}

int luatolk_Load(lua_State* L) {
	Tolk_Load();
	return 0;
}

int luatolk_Unload(lua_State* L) {
	Tolk_Unload();
	return 0;
}
