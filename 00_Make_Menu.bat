@echo OFF
cls
set CUR_PATH=%~dp0

set FBUILD=%~dp0\Tools\FastBuild
set FBUILD_CONFIG_WIN32=%~dp0\Tools\BuildWin32\fbuild.bff
set FBUILD_CONFIG_NATIVE=%~dp0\Tools\BuildNative\fbuild.bff

set Prj_WIN32=%~dp0\\Prj\Win32 
set Prj_ANDROID=%~dp0\\Prj\Android 

color 02
echo.
echo 	===================================
echo 	===============MENU================
echo 	===================================
echo.
echo 	  Working ON: %CUR_PATH%
echo.

echo 	0. Clean
echo 	1. Build Data
echo 	2. Build Win32
echo 	3. Build SO
echo 	4. Build APK Debug
echo 	5. Build Full (SO + Apk)

echo 	99. Exit

echo.
set /p opt=		Enter choose: 

if "%opt%"=="0" goto Clean
if "%opt%"=="1" goto Build_Data
if "%opt%"=="2" goto Build_Win32
if "%opt%"=="3" goto Build_Native
if "%opt%"=="4" goto Build_Apk
if "%opt%"=="5" goto Build_Full

REM 00. Clean GIT
:Clean

goto :End

REM------------ 01. Build Data-------------
:Build_Data

goto :End
REM----------------------------------------

REM------------ 02. Build Win32------------
:Build_Win32
	echo Build win32
	cd %FBUILD%
	call %FBUILD%\FBuild.exe -config %FBUILD_CONFIG_WIN32%
goto :End	

REM------------ 03. Build SO---------------
:Build_Native
	echo Build SO
	cd %FBUILD%
	call %FBUILD%\FBuild.exe -config %FBUILD_CONFIG_NATIVE%
goto :End	
REM----------------------------------------

REM------------ 03. Build APK---------------
:Build_Apk
	echo Build APK
	cd %Prj_ANDROID%
	call gradlew.bat assembleDebug
	adb install -r app\build\outputs\apk\debug\app-debug.apk
	adb shell am start -n "hieu.com.a3dengine/hieu.com.a3dengine.MainActivity" -a android.intent.action.MAIN -c android.intent.category.LAUNCHER

goto :End	
REM----------------------------------------

REM------------ 03. Build Full---------------
:Build_Full
	echo Build Full SO + Apk
	goto Build_Native
	
	goto Build_Apk
	
goto :End	
REM----------------------------------------

:End

pause

cd %CUR_PATH%
call 00_Make_Menu.bat

