#ifndef WindowWin32_h
#define WindowWin32_h

#include <Windows.h>


class WindowWin32
{
public:
	WindowWin32();
	void Init(char* name, int widht, int height);
	void Show();

	void* GetWindowhandle();

	int windowWidth;
	int windowHeight;
	char* nameWindow;

	MSG msg;

private:
	HWND hWnd;
};


#endif //WindowWin32_h