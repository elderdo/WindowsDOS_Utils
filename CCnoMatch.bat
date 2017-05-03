@echo off
:: CCnoMatch.bat
:: Date written 10/16/2011
:: Written by Douglas S. Elder
:: Used to try to resolve Clear Case
:: files that don't have a matching version
:: in production

setlocal enabledelayedexpansion

set DIR=%2
set AllIdentical=N
call :getFile %1 %DIR% dev
call :getFile %1 %DIR% integrated
call ct.bat diff %TEMP%\dev\%1 %TEMP%\integrated\%1 > NUL
if %ERRORLEVEL%==0 (
	call ct.bat diff %TEMP%\integrated\%1 %1 > NUL
	:: the dos command processor evaluates all variables
	:: inside a block except variables used within a "call"
	:: otherwise %ERRORLEVEL% woud maintain its previous value
	:: see http://stackoverflow.com/questions/4948112/weird-dos-batch-script-reporting-of-errorlevel
	if %%ERRORLEVEL%%==0 set AllIdentical=Y
)

::  set date variables
set dt=%date:~4%
set yy=%dt:~6%
set mm=%dt:~0,2%
set dd=%dt:~3,2%

if "%AllIdentical%"=="Y" (
	call ct.bat ci -c "Prod version setup" %1 
	@echo Corrected %1: %mm%/%dd%/%yy%
	call ct.bat mklabel -replace SDS-AMD-PROD %1
	call ct.bat lshistory %1
) else (
	call ct.bat lsvtree %1
	@echo prod and the current version on ClearCase differ for %1 as follows:
	call ct.bat diff -pred %1
	@echo review and correct ClearCase for %1
)
goto end

:getFile
if not exist %TEMP%\%3\NUL mkdir %TEMP%\%3
call ftpFile.bat -d src -c get -e %3.txt -o %TEMP%\%3\%1  %1
goto:eof

:end
endlocal

