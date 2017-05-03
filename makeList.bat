:: makeList.bat
:: Author: Douglas S. Elder
:: Date: 3/21/2013
:: Desc: take a file and output its first field
:: delimited by spaces into a single list
@echo off
:loop
if "%1"=="-d" goto setDebug
if "%1"=="-q" goto setQuote
if "%1"=="" goto Usage
if "%QUOTE%"=="Y" type %1 | gawk "BEGIN { ORS = "","" } { print ""'"" $1 ""'"" }" | sed "s/,$/\n/" & goto:eof
type %1 | gawk "BEGIN { ORS = "","" } { print $1 }" | sed "s/,$/\n/" & goto:eof

goto:eof

:Usage
@echo.makeList.bat [-d -q] file
@echo.where 
@echo.  -d turns on debugging
@echo.  -q single quotes each element of the list
@echo.  the first field of each record for the file is made into a
@echo.  comma delimited list
goto:eof

:setQuote
shift
set QUOTE=Y
goto loop

:setQuote
shift
@echo on
goto loop
