#ifndef Application_h
#define Application_h

#include <stdio.h>

class Application 
{
public:
	bool Init(void *window, int width, int height);
	void Update();
	//void Pause();
	//void Resume();
	void Exit();
};

#include <jni.h>
#include <string>

extern "C"
JNIEXPORT jstring JNICALL
Java_hieu_com_a3dengine_MainActivity_stringFromJNI(
        JNIEnv *env,
        jobject /* this */) {
    std::string hello = "Hieu zz Hello from C++";
    return env->NewStringUTF(hello.c_str());
}


#endif // Application_h