@echo off
:: copyToDev.bat
:: Date 5/22/2012
:: Author: Douglas S. Elder
:: Desc: copy a file from a PC to
:: the AMD dev server
@echo off
setlocal
set HOST=sbhs9131.slb.cal.boeing.com
set COPY_TO_DIR=

:loop
if "%1"=="-d" goto setDir
if "%1"=="-h" goto setHost
if "%1"=="" goto Usage

scp %1 %HOST%:%COPY_TO_DIR%%1
goto done

:setHost
shift
if "%1"=="" goto Usage
set HOST=%1
if "%1"=="dev" set HOST=sbhs9131.slb.cal.boeing.com
if "%1"=="int" set HOST=sbhs6144.slb.cal.boeing.com
if "%1"=="prd" set HOST=sbhs3044.slb.cal.boeing.com
if "%1"=="prod" set HOST=sbhs3044.slb.cal.boeing.com
shift
goto loop

:setDir
shift
if "%1"=="" goto Usage
set COPY_TO_DIR=%1/
shift
goto loop

:Usage
@echo.Usage copyToDev [-d dir] [-h host] file_to_copy
@echo.where -d dir is an optional Unix directory name to place (default is $HOME)
@echo.and -h host is an optional Unix hostname (default is sbhs9131)
@echo.and file_to_copy is the required name of the file you want copied
:done
endlocal


