:: sftp_batch.bat
:: Author: Douglas S. Elder
:: Date: 11/17/2015
:: Desc: sftp a file 
@echo off

setlocal
:: set defaults
set SHARE=\\sw.nos.boeing.com\c17data\data197\Douglas\C\xorCrypt
set FILE=xor-crypt.c
set SERVER=ssd-sw-3000.vmpc1.cloud.boeing.com
set DESTDIR=/apps/CRON/AMD/src
set CYGWIN_HOME=C:\cygwin
set BIN=%CYGWIN_HOME%\bin
set SFTPCMDS=sftp_cmds.txt

:loop
if "%1"=="-s" goto setShare
if "%1"=="-d" goto setDestDir
if "%1"=="-f" goto setFile
if "%1"=="-h" goto usage
if "%1"=="-x" goto setDebug

if NOT exist %SHARE% goto badShare
if NOT exist %SHARE%\%FILE% goto badFile
:: send stdout to NUL
copy %SHARE%\%FILE% %TEMP%\%FILE% > NUL
if %ERRORLEVEL% neq 0 goto copyError

cd %TEMP%
if exist %TEMP%\sftp_cmd.txt del %TEMP%\sftp_cmds.txt
@echo put %FILE% > %TEMP%\%SFTPCMDS%
@echo quit >> %TEMP%\$SFTPCMDS%
:: use explicit path if c:\cygwin is not in PATH
:: if private / public keys are setup with ssh-keygen
:: then there will not be a prompt for the password
:: assumes using current windows id to login to server
%BIN%\sftp -b %TEMP%\%SFTPCMDS% %SERVER%:%DESTDIR% 
if %ERRORLEVEL% neq 0 goto sftpError

:: cleanup
del %TEMP%\%FILE%
del %TEMP%\%SFTPCMDS%

goto:eof

:copyError
@echo one or more errors occured while trying to copy
@echo %FILE% to %TEMP%\%FILE%
goto:eof

:badShare
@echo %SHARE% does not exist
goto:eof

:badFile
@echo %SHARE%\%FILE% does not exist
goto:eof

:sftpError
@echo one or more errors occured while trying to sftp
@echo %FILE% to %SERVER%:%DESTDIR%
goto:eof

:setFile
shift
if "%1"=="" goto usage
set FILE=%1
shift
goto loop

:setShare
shift
if "%1"=="" goto usage
set SHARE=%1
shift
goto loop

:setDestDir
shift
if "%1"=="" goto usage
set DESTDIR=%1
shift
goto loop

:setDebug
shift
@echo on
goto loop

:usage
@echo.sftp_batch.bat [ -d dest_dir ] [ -f file ] [ -h ] [ -s server ] [ -x ]
@echo.where  -d dest_dir overrides the destionation directory
@echo.       (default is /apps/CRON/AMD/src ) 
@echo. 
@echo.       -f file overrides the file to be sftp'ed
@echo.       (default is xor-crypt.c )
@echo. 
@echo.       -h echo's this message
@echo. 
@echo.       -s server overrides the server
@echo.       (default is ssd-sw-3000.vmpc1.cloud.boeing.com
@echo. 
@echo.       -x turns on debug
goto:eof

endlocal


