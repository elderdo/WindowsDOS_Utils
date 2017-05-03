@echo off
:: ccStart.bat
:: Author: Douglas S. Elder
:: Date: 2/16/2015
:: Desc: check if the laptop is hooked to the network
:: if it is then start up my ClearCase view
setlocal
set VIEW=zf297a_c17pss_unix_view
set VOBS="\SDS-AMD \SDS-BSSM"
set VOBS=%VOBS:"=%

NET START ALBD
NET START LOCKMGR
NET START CCCREDMGR

if not exist \\sw.nos.boeing.com\c17data goto notConnectedToBoeing

:loop
if "%1"=="-d" goto setDebug
if "%1"=="-v" goto setView
if "%1"=="-o" goto setVobs

cleartool startview %VIEW%
for %%a in ( %VOBS% ) do cleartool mount %%a
goto:eof

:setDebug
shift
@echo on
goto:loop

:setView
shift
if "%1"=="" goto Usage
set VIEW=%1
goto loop

:Usage
@echo.Usage:
@echo.ccstart.bat [ -v view -o vob1 vob2 ... ]
@echo.where       -v view sets the view directory 
@echo.               the default view is zf297a_c17pss_unix_view
@echo.            -o vob1 vob2 ... where you specify a list of 
@echo.               vobs to be mounted
@echo.               the defaults are \SDS-AMD \SDS-BSSM
goto:eof

:setVobs
shift
if "%1"=="" goto Usage
set VOBS=
set VOBS=%1
:: get rid of double quotes
set VOBS=%VOBS:"=%
shift
:loop2
if "%1"=="" goto loop
if "%1:~0,1"=="-" goto loop
set VOBS=%VOBS% %1
shift
goto :loop2


:notConnectedToBoeing
@echo not connected to the Boeing network
goto:eof

endlocal
