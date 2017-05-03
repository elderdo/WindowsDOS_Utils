@echo off
echo 1=%1 2=%2

:: get just the filename
echo %~nx1

copy "%1" "%TEMP%\%1"

echo Remove Extension from What file(include extension)?
set /p file=?
set noext=%file:~0,-4%
echo ren %file% %noext%

if (%2)==(-d) (
	echo debug is on
)

echo Done
pause

