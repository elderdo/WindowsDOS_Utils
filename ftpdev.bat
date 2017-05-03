:: ftpdev.bat
:: Date: 11/25/2013
:: Author: Douglas S. Elder
:: Description: use sftp to
:: get and put data from the
:: development server
::
setlocal ENABLEDELAYEDEXPANSION
set USER=amduser
set SERVER=ussevm76.cs.boeing.com
set APPHOME=/apps/CRON
set APP=AMD
set DIR=%APPHOME/%APP/SUBMIT

:loop
if "%1"=="-d" goto SetDir
if "%1"=="-h" goto Usage
if "%1"=="-r" goto SetRmads


sftp %USER@%SERVER:%DIR
goto :eof

:SetRmads
shift
set USER=rmadadmn
set APP=RMAD
set DIR=%APPHOME/%APP/bin
goto loop

:SetDir
shift
if "%1"=="" set DIR=%APPHOME/%APP:goto loop
set DIR=%1
shift
goto loop

:Usage
@echo."Usage ftpdev.bat [-d dir] [-h] [-r]
@echo."where -d dir specifies the directory"

endlocal



