@echo off
Rem concat.bat
Rem Author: Douglas S. Elder
Rem Date: 1/3/2017
Rem Desc: Concatenate the strings from a file into
Rem one string and separate each string with a semicolon
Rem

setlocal EnableDelayedExpansion

:loop
if "%1"=="-d" goto setDebug
if "%1"=="" goto usage
if not EXIST %1 goto notFound

set var=
for /f "delims=" %%a in (%1) do (
  if "!var!"=="" (
    set var="%%~sa"
  ) else (
    set var="!var!%DELIM%%%~sa"
    set var="!var:"=!
  )
)
echo %var%
goto :eof

:setDebug
@echo on
shift
goto loop

:usage
@echo Usage: concat [ -d -c char] file
@echo where -d is an optional argument that turns on debugging
@echo       -c char where char is the string separator. Default is semicolon
@echo       file is a text file containing a 1 or more lines of text
goto :eof

:notFound
@echo %1 not found
goto :eof

endlocal
