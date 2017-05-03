@echo off
setlocal

if "%1"=="" goto usage
if "%2"=="" goto usage
call ftpFile.bat -c get -d %2 -e integrated.txt %1
goto end

:usage
@echo ftphs1186.bat filename directory
:end
endlocal
