#include <stdio.h>

#include "Application.h"

#include "CreateWindow\WindowWin32.h"


int main() 
{
	printf("Hello to 3d Engine Training");
	bool isLive = true;

	// 1. Init Windows 
	WindowWin32 window;
	window.Init("TrungHieu", 320, 480);
	window.Show();

	// 2. Init App
	Application newApp;
	newApp.Init(window.GetWindowhandle(), window.windowWidth, window.windowHeight);
	
	// 3. Main Loop 
	while (isLive)
	{
		if (PeekMessage(&window.msg, NULL, 0, 0, PM_REMOVE))
		{
			if (window.msg.message == WM_QUIT)
			{
				isLive = false;
			}
			else
			{
				TranslateMessage(&window.msg);
				DispatchMessage(&window.msg);
			}
		}
		// Update App
		newApp.Update();
	}

	// 4. Exit App
	newApp.Exit();
	
	return 0;
}