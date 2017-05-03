:: mostRecent.bat
:: Author: Douglas S. Elder
:: Date: 3/6/2013
:: Description: list the most recent file
::
@echo off
setlocal ENABLEDELAYEDEXPANSION 
set FPREFIX=^*
set FEXT=^*
:loop
if "%1"=="-d" goto setDebug
if "%1"=="-e" goto setExtension
if "%1"=="-p" goto setPrefix
if not "%1"=="" goto Usage

for /f "delims=" %%x in ('dir /od /b %FPREFIX%.%FEXT%') do set recent=%%x
echo %recent%
goto :eof

:setPrefix
shift
if "%1"=="" goto Usage
set FPREFIX=%1
shift
goto loop

:setExtension
shift
if "%1"=="" goto Usage
set FEXT=%1
shift
goto loop

:setDebug
shift
@echo on
goto loop

:Usage
@echo.Usage mostRecent.bat [ -e fileExtention -p filePrefix ] 
@echo. 
@echo.where the following are all optional parameters
@echo.      -e fileExtension list the most recent file with this extension - default is *
@echo.      -p filePrefix list the most recent file with this prefix - default is *
@echo.
goto :eof


endlocal
