:: moveWithTimeStamp.bat
:: Author: Douglas S. Elder
:: Date: 02/10/2015
:: Description: move a file to a directory
:: and prefix it with a time stamp
:: if the file is empty just delete it
::
::
::
@echo off
:loop
if "%1"=="-d" goto setDebug
if "%1"=="" goto missingSource
if not exist %1 goto sourceNotExist
if "%2"=="" goto missingDest
if not exist %2\NUL goto destNotExist

setlocal ENABLEDELAYEDEXPANSION 
:: get the date and time and then into single variable
for /F "tokens=2-4 delims=/ " %%i in ('date /t') do set tdtd=%%k_%%i_%%j
for /F "tokens=1-4 delims=/ " %%i in ('date /t') do @echo i=%%i j=%%j k=%%k l=%%l m=%%m
@echo tdtd=%tdtd%
set PATH=C:\Windows\System32;%PATH%
for /F "tokens=5-8 delims=:. " %%i in ('echo.^| time ^| find "current" ') do set ttrn=%%i_%%j_%%k_%%l
for /F "tokens=5-8 delims=:. " %%i in ('echo.^| time ^| find "current" ') do @echo i=%%i j=%%j k=%%k
set ttrn=0%ttrn%
echo ttrn=%ttrn%
set ttrn=%ttrn:~-11%
echo ttrn=%ttrn%
set timestamp=%tdtd%_%ttrn%

set source=%1
set dest=%2
if %~z1 == 0 goto emptyFile
move %source% %dest%\%timestamp%_%source%
goto done

:setDebug
shift
@echo on
goto loop

:emptyFile
@echo %1 is empty - deleted
del %1
goto done

:missingSource
@echo "Missing source file"
goto usage

:sourceNotExist
@echo "%1 does not exist"
goto usage

:destNotExist
@echo "%2 is not a directory"
goto usage

:missingDest
@echo "Missing destination directory"
goto usage

:usage
@echo.Usage: moveWithTimeStamp.bat sourceFile destinationDirectory

:done
endlocal
