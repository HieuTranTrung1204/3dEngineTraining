#include "Application.h"

bool Application::Init(void *window, int width, int height)
{
	printf("\nApplication::init");

	return true;
}

void Application::Update()
{
	printf("\nApplicaiton::Update");
}

void Application::Exit()
{
	printf("\nApplicaiton::Exit");
}