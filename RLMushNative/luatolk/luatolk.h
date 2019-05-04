#pragma once
#include "lua.hpp"

#define LUATOLK

// Load and unload
LUATOLK int luatolk_Load(lua_State*);
LUATOLK int luatolk_Unload(lua_State*);

// Tolk information
LUATOLK int luatolk_IsLoaded(lua_State*);
LUATOLK int luatolk_DetectScreenReader(lua_State*);
LUATOLK int luatolk_HasBraille(lua_State*);
LUATOLK int luatolk_HasSpeech(lua_State*);

// Output functions
LUATOLK int luatolk_Output(lua_State*);
LUATOLK int luatolk_Speak(lua_State*);
LUATOLK int luatolk_Braille(lua_State*);
LUATOLK int luatolk_Silence(lua_State*);
