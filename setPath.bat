@echo off
Rem setPath.bat
Rem Author: Douglas S. Elder
Rem Date: 1/3/2017
Rem Desc: create a PATH environment variable using
Rem a text file with a list of directories
Rem as input
Rem
Rem The resulting PATH variable will have the same order as the file
Rem and each directory will be in its most compact short name form
Rem
Rem DOS command prompt Usage: setPath.bat file
Rem where file is the text file containing the directory list
Rem or from a bat script
Rem call setPath.bat file 


:loop
if "%1"=="-d" goto setDebug
if "%1"=="-v" goto setVerbose
if "%1"=="" goto usage
if not EXIST %1 goto notFound

for /f "tokens=* usebackq" %%a in (`cscript /nologo %USERPROFILE%\Documents\vbScript\makePath.vbs %1`) do set PATH=%%a

if "%VERBOSE%"=="Y" echo %PATH%
goto :eof

:setDebug
@echo on
shift
goto loop

:setVerbose
set VERBOSE=Y
shift
goto loop

:usage
@echo Usage: setPath [ -d -v ] file
@echo where -d is an optional argument that turns on debugging
@echo       -v is an optional argument that displays the PATH variable
@echo       file is a text file containing a list of directories
@echo       each directory is on a separate line.  The output PATH
@echo       will have the same directory order as the file
goto :eof

:notFound
@echo %1 not found
goto :eof
