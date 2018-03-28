#include "WindowWin32.h"

//
//
// WndProc - Window procedure
//
//
LRESULT
CALLBACK
WndProc(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam)
{
	switch (uMsg)
	{
	case WM_DESTROY:
		::PostQuitMessage(0);
		break;
	default:
		return ::DefWindowProc(hWnd, uMsg, wParam, lParam);
	}

	return 0;
}

WindowWin32::WindowWin32()
{

}

void WindowWin32::Init(char* name, int width, int height)
{
	/*this->windowWidth = width;
	this->windowHeight = height;
	this->nameWindow = name;*/
	
	HINSTANCE hInstance = GetModuleHandle(NULL);

	// Setup window class attributes.
	WNDCLASSEX wcex;
	ZeroMemory(&wcex, sizeof(wcex));

	wcex.cbSize = sizeof(wcex);	// WNDCLASSEX size in bytes
	wcex.style = CS_HREDRAW | CS_VREDRAW;		// Window class styles
	wcex.lpszClassName = TEXT("MYFIRSTWINDOWCLASS");	// Window class name
	wcex.hbrBackground = (HBRUSH)(COLOR_WINDOW + 1);	// Window background brush color.
	wcex.hCursor = LoadCursor(hInstance, IDC_ARROW); // Window cursor
	wcex.lpfnWndProc = WndProc;		// Window procedure associated to this window class.
	wcex.hInstance = hInstance;	// The application instance.

	// Register window and ensure registration success.
	if (!RegisterClassEx(&wcex))
	{

	}
	CREATESTRUCT cs;
	ZeroMemory(&cs, sizeof(cs));

	cs.x = 0;	// Window X position
	cs.y = 0;	// Window Y position
	cs.cx = width;	// Window width
	cs.cy = height;	// Window height
	cs.hInstance = hInstance; // Window instance.
	cs.lpszClass = wcex.lpszClassName;		// Window class name
	cs.lpszName = TEXT(name);	// Window title
	cs.style = WS_OVERLAPPEDWINDOW;		// Window style

										// Create the window.
	hWnd = ::CreateWindowEx(
		cs.dwExStyle,
		cs.lpszClass,
		cs.lpszName,
		cs.style,
		cs.x,
		cs.y,
		cs.cx,
		cs.cy,
		NULL,
		NULL,
		cs.hInstance,
		NULL);

}

void WindowWin32::Show()
{
	// Display the window.
	::ShowWindow(hWnd, SW_SHOWDEFAULT);
	::UpdateWindow(hWnd);
}

void* WindowWin32::GetWindowhandle()
{
	return hWnd;
}
