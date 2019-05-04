#pragma once

char* FromWideChar(const wchar_t*);
wchar_t* FromMultiByte(const char*);
int ToLuaBoolean(const bool);
bool FromLuaBoolean(const int);
