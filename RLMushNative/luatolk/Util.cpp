#include "stdafx.h"
#include "util.h"
#include <cstdlib>
#include <cstring>

using namespace std;

char* FromWideChar(const wchar_t* src)
{
	char* buffer;
	size_t bytesCount, bytesWritten;
	errno_t success;
	success= wcstombs_s(&bytesCount, NULL, 0, src, _TRUNCATE);

	// If success is a non-zero value, an error has been occurred
	if (success)
	{
		return NULL;
	}

	buffer = new char[bytesCount + 1];
	success = wcstombs_s(&bytesWritten, buffer, bytesCount, src, _TRUNCATE);

	if (success)
	{
		delete buffer;
		return NULL;
	}

	return buffer;
}

wchar_t* FromMultiByte(const char* src)
{
	wchar_t* buffer;
	size_t charCount, writtenChars;
	errno_t success;

	// Check how much space we need in the buffer
	success = mbstowcs_s(&charCount, NULL, 0, src, _TRUNCATE);
	if (success)
	{
		return NULL;
	}

	// Allocate, including a space for the NULL character
	buffer = new wchar_t[charCount + 1];
	success = mbstowcs_s(&writtenChars, buffer, charCount, src, _TRUNCATE);
	if (success)
	{
		delete buffer;
		return NULL;
	}

	return buffer;
}

int ToLuaBoolean(const bool B)
{
	if (B)
	{
		return 1;
	}

	return 0;
}

bool FromLuaBoolean(const int B)
{
	if (B == 1)
	{
		return true;
	}

	return false;
}
