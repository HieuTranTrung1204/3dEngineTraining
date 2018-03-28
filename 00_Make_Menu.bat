@echo OFF
cls
set CUR_PATH=%~dp0 

set FBUILD=%~dp0\Tools\FastBuild
set FBUILD_CONFIG_WIN32=%~dp0\Tools\BuildWin32\fbuild.bff
set FBUILD_CONFIG_NATIVE=%~dp0\Tools\BuildNative\fbuild.bff

color 02
echo.
echo    ===================================
echo    ===============MENU================
echo    ===================================
echo.
echo WorkiNG ON: %CUR_PATH%
echo.

echo 0. Clean
echo 1. Build Data
echo 2. Build Win32

echo 99. Exit

echo.
set /p opt=Enter choose: 

if "%opt%"=="0" goto Clean
if "%opt%"=="1" goto Build_Data
if "%opt%"=="2" goto Build_Win32

REM 00. Clean GIT
:Clean

goto :End

REM------------ 01. Build Data
:Build_Data

goto :End

REM------------ 02. Build Win32
:Build_Win32
	echo Build win32
	cd %FBUILD%
	call %FBUILD%\FBuild.exe -config %FBUILD_CONFIG_WIN32%
goto :End	

REM------------ 02. Build SO
	echo Build SO
	cd %FBUILD%
	call %FBUILD%\FBuild.exe -config %FBUILD_CONFIG_NATIVE%
:Build_SO

goto :End	

:End

pause

call 00_Make_Menu.bat


