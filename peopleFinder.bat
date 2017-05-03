@echo off
if "%1"=="" goto error
grep -i "%1" "%USERPROFILE%\Desktop\Text Files\phoneNumbers.txt"
pause
goto end
:error
echo "Usage: peopleFinder.bat searchString"
:end
