:: vim:sw=2:ts=2:expandtab:sts=2:autoindent:smartindent:syn=dosbatch
:: loadBenchStock.bat
:: Author: Douglas S. Elder
:: Date: 02/22/2017
:: Description: Upload a dmp or gz file
:: to the prod SPO server for import

@echo off
setlocal ENABLEDELAYEDEXPANSION 
:: set defaults
set DIR=/websites/escmapps/control/dmp
set HOST=app-ehs-d3001a.stl.mo.boeing.com
set UID=escm

:loop
if "%1"=="-h" goto setHost
if "%1"=="-d" goto setDir
if "%1"=="-u" goto setUid


:: get latest dmp file
pushd %USERPROFILE%\Downloads
for /f "tokens=*" %%a in ('dir /b /od *.dmp *.gz') do set newest=%%a
:: use the most recent file as input
if "%newest%"=="" goto inputNotFound
echo Using %newest% import file

echo put %newest% > %TEMP%\sftp.txt
echo quit >> %TEMP%\sftp.txt

sftp -b %TEMP%\sftp.txt ^
  %UID%@%HOST%:%DIR%
echo %newest% uploaded to %HOST%:%DIR% for %UID%
goto:eof

:setHost
shift
if "%1"=="" goto Usage
set HOST=
if "%1"=="prod" set HOST==app-ehs-p3001a.stl.mo.boeing.com
if "%1"=="dev"  set HOST=app-ehs-d3001a.stl.mo.boeing.com  
if "%1"=="test"  set HOST=app-ehs-t3001a.stl.mo.boeing.com
if  "%HOST%"=="" goto Usage
shift
goto loop

:setUid
shift
if "%1"=="" goto Usage
set UID=%1
shift

:setDir
shift
if "%1"=="" goto Usage
set DIR=%1
shift
goto loop


:inputNotFound
@echo "could not find .gz or .dmp file in the %USERPROFILE%\Downlaods directory"
goto:eof

:Usage
echo "uploadSpoImport.bat [ -d dir -h prod | dev | test  -u uid ]"
echo "  where -d dir sets the target directory
echo "        -h prod sets the host to the SPO prod server"
echo "        -h dev sets the host to the SPO dev server"
echo "        -h test sets the host to the SPO test server"
echo "        -u uid sets the account used for %HOST%"

:done
endlocal
