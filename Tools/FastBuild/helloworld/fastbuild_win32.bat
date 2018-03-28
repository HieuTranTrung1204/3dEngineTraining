@echo OFF
cls
set CUR_PATH=%~dp0

set FASTBUILD_PATH=%CUR_PATH%..\

echo Fastbuild in: %FASTBUILD_PATH%
call %FASTBUILD_PATH%\FBuild.exe -config %CUR_PATH%\win32\fbuild.bff
pause