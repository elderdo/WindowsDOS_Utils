@echo off
:: myexp.bat
setlocal ENABLEDELAYEDEXPANSION 

set UID=%USERNAME%
set HOST_STRING=AMD
set OPT_FILE=

:loop
if "%1" == "-d" goto setDebug
if "%1" == "-h" goto setHOST_STRING
if "%1" == "-o" goto setOptFile
if "%1" == "-p" goto setPwd
if "%1" == "-u" goto setUid

if EXIST %OPT_FILE% (
for /f "eol=;" %%A in (%OPT_FILE%) do (
	  set %%A
  )
)

if "%PWD%" == "" goto noPwd
if "%UID%" == "" goto noUid
if "%HOST_STRING%" == "" goto noHostString
if "%LOG%" == "" goto noLog
if "%DMP%" == "" goto noDmp

exp %UID%/%PWD%@%HOST_STRING% ^
    log=%LOG% ^
    file=%DMP% ^
    consistent=y ^
    statistics=none ^
    recordlength=65535 ^
    buffer=2000000 ^
    direct=y ^
    compress=n
@echo ERRORLEVEL=%ERRORLEVEL%
goto:eof

:setOptFile
shift
if "%1" == "" goto Usage
set OPT_FILE=%1
shift
goto loop

:setDebug
shift
@echo on
goto loop

:setHOST_STRING
shift
if "%1" == "" goto Usage
set HOST_STRING=%1
shift
goto loop

:setPwd
shift
if "%1" == "" goto Usage
set PWD=%1
shift
goto loop

:setUid
shift
if "%1" == "" goto Usage
set UID=%1
shift
goto loop

:Usage
@echo.Usage: myexp [ -h HOST_STRING -p pwd -u uid ]
@echo.where  -h HOST_STRING sets the db tnsname
@echo.       -p pwd sets the Oracle password
@echo.       -u uid sets the Oracle userid
goto:eof

:noPwd
@echo.Missing password for %UID%@%HOST_STRING%
endlocal
