@echo off
setlocal
set find=c:\windows\system32\find.exe
set file=%1
set /a cnt=0
for /f %%a in ('type "%file%"^|%find% "" /v /c') do set /a cnt=%%a
echo %file% has %cnt% lines
endlocal
