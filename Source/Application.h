#ifndef Application_h
#define Application_h

#include <stdio.h>

class Application 
{
public:
	bool Init(void *window, int width, int height);
	void Update();
	void Pause();
	void Resume();
	void Exit();
};

#endif // Application_h