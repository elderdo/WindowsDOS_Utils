@echo off
setlocal enabledelayedexpansion
set myvar=
for /f "delims=" %%i In (path.txt) DO (
  if "!myvar!"=="" (
    set myvar=%%i
  ) else (
    set myvar=!myvar: =!;%%i
  )
)
echo %myvar%

