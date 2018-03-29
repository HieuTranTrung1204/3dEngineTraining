@echo OFF
set CUR_PATH=%~dp0

set ndk_path=D:\DevTools\Android\sdk\ndk-bundle
set ndk_clang=%ndk_path%\toolchains\llvm\prebuilt\windows-x86_64\bin\clang++.exe

set src_cpp=%CUR_PATH%\..
set src_build=%src_cpp%\native-lib.cpp

set out_build_o=%src_cpp%\android\Out\native-lib.o
REM set out_build_so=%src_cpp%\android\Out\native-lib.so


call %ndk_clang% -I%ndk_path%\sysroot\usr\include -I%ndk_path%\sources\cxx-stl\llvm-libc++\include -I%ndk_path%\platforms\android-21\arch-arm\usr\include -target armv7-none-linux-androideabi -c %src_build% -o %out_build_o%

pause
