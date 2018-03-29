@echo OFF
set CUR_PATH=%~dp0

set ndk_path=D:\DevTools\Android\sdk\ndk-bundle
set ndk_clang=%ndk_path%\toolchains\llvm\prebuilt\windows-x86_64\bin\clang++.exe

set src_cpp=%CUR_PATH%\..
set src_build=%src_cpp%\native-lib.cpp

set in_build_o=%src_cpp%\android\Out\native-lib.o
set out_build_so=%src_cpp%\android\Out\native-lib.so


call %ndk_clang% -Wl,-soname,%out_build_so% -shared %in_build_o% -lstdc++ -lGLESv2 -llog -lc -lm -lz -ldl -lgcc -landroid -lOpenSLES -lEGL -lgcc -gcc-toolchain %ndk_path%\toolchains\arm-linux-androideabi-4.9\prebuilt\windows-x86_64 -march=armv7-a -target armv7-none-linux-androideabi --sysroot=%ndk_path%\platforms\android-21\arch-arm -o %out_build_so%

pause

