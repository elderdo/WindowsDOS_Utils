setlocal enabledelayedexpansion
set str=15 Trailing Spaces to truncate               &rem
echo."%str%"
for /l %%a in (1,1,31) do if "!str:~-1!"==" " set str=!str:~0,-1!
echo."%str%"

