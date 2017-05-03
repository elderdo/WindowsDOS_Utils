:: startCCservices.bat
:: Author: Douglas S. Elder
:: Date: 11/02/2012
:: Desc: start all the services needed by 
:: ClearCase
@echo off
:loop
if "%1"=="-d" goto setDebug
setlocal enabledelayedexpansion
set winFind=C:\Windows\System32\find.exe
net start albd
net start cccredmgr
net start lockmgr
net start mvfs
goto:eof

:setDebug
shift
@echo on
goto:loop


