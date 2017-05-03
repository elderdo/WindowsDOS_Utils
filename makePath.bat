:: makePath.bat
:: Author: Douglas S. Elder
:: Date: 9/14/2012
:: Desc: Read a file and create a
:: concatenated list of directories 
:: separated by a semi-colon
@echo off
setlocal enabledelayedexpansion
set FILEIN=path.txt
set DELIM=;

:loop
if "%1"=="-s" goto setDelim
if "%1"=="-d" goto setDebug
if not "%1"=="" set FILEIN=%1
set myvar=
for /f "usebackq delims=" %%i in (%FILEIN%) do (
  set str=%%i
  for /l %%a in (1,1,31) do if "!str:~-1!"==" " set str=!str:~0,-1!
  if "!myvar!"=="" (
    set myvar=!str!
  ) else (
    set myvar=!myvar!;!str!
  )
)

echo %myvar%
goto :eof

:setDelim
shift
if "%1"=="" goto Usage
set DELIM=%1
shift
goto loop


:setDebug
shift
@echo on
goto loop

:Usage
@echo.Usage: makePath.bat [-s delim] [file]
@echo.where -s delim specifies the delimiter to use
@echo.         to separate each item in the input file
@echo.         when concatenating it into an environment
@echo.         variable (default is a semicolon)
@echo.and file is a file containing one item per line that
@echo.         will be concatenated and ouput to stdout
@echo.         (default is path.txt)
goto :eof

:concat
if "%myvar%"=="" (
  set myvar="%1"
) else (
  set myvar=%myvar%;"%1"
)
goto :eof
endlocal
