@echo off

setlocal

set WorkDir=%TEMP%
set FTP_HOME=%systemroot%\system32
set FTP_EXE=ftp.exe
set SCRIPT_HOME=C:\Users\zf297a\Documents\DOS
set EXT_PARAMS=%SCRIPT_HOME%\prod.txt
set AMD_HOME=/apps/CRON/AMD
set OUTPUT_FILE=

:loop
if "%1"=="-o" goto setOutputFile
if "%1"=="-e" goto setExtFile
if "%1"=="-u" goto setUID
if "%1"=="-h" goto setHost
if "%1"=="-c" goto setCMD
if "%1"=="-d" goto setDIR
if "%1"=="-f" goto setFTPOPT
if "%1"=="-p" goto setPWD
if "%1"=="-x" goto setDebug
if "%1"=="" goto Usage
if "%UID%"=="" set UID=amduser
if "%HOST%"=="" set HOST=hs1189
if "%CMD%"=="" set CMD=put
if "%DIR%"=="" set DIR=%AMD_HOME%/SUBMIT
if "%PWD%"=="" call :getExternParams
if "%PWD%"=="" goto end

> %TEMP%\script.txt echo open %HOST%
>> %TEMP%\script.txt echo %UID%
>> %TEMP%\script.txt echo %PWD%
>> %TEMP%\script.txt echo cd %DIR%
>> %TEMP%\script.txt echo %CMD% %1 %OUTPUT_FILE%
>> %TEMP%\script.txt echo quit
start /w %systemroot%\system32\ftp.exe %FTPOPT% -s:%TEMP%\script.txt
goto end

:Usage
@echo ftpFile -u userid -h host -d dir -c ftpcmd file
goto end

:abort
@echo %1
exit /B %2
goto end

:getExternParams
for /f %%A in (%EXT_PARAMS%) do (
	set %%A
)
goto:eof

:getPWDInteractive
@echo Enter Password for %UID%:
for /F "usebackq" %%A in (`getHiddenText.exe`) do set PWD=%%A
if "%PWD%"=="" (
	call :abort "Bad password %PWD%" 4
	goto end
)
goto:eof

:setUID
shift
if "%1"=="" goto usage
set UID=%1
shift
goto loop

:setHost
shift
if "%1"=="" goto usage
set HOST=%1
shift
goto loop

:setCMD
shift
if "%1"=="" goto usage
set CMD=%1%
shift
goto loop

:setDIR
shift
if "%1"=="" goto usage
set DIR=%AMD_HOME%/%1
shift
goto loop

:setFTPOPT
shift
if "%1"=="" goto usage
set FTPOPT=%1
shift
goto loop

:setPWD
shift
if "%1"=="" goto usage
set PWD=%1
shift
goto loop

:setDebug
shift
@echo on
goto loop

:setOutputFile
shift
if "%1"=="" goto usage
set OUTPUT_FILE=%1
shift
goto loop

:setExtFile
shift
if "%1"=="" goto usage
set EXT_PARAMS=%SCRIPT_HOME%\%1
if not exist %EXT_PARAMS% (
	@echo %EXT_PARAMS% does not exist
	goto end
)
shift
goto loop

:usage
@echo ftpfile.bat [-u uid -h host -c cmd -d dir -f ftpopt -p pwd]
@echo where -u uid sets the userid
@echo -h host sets the hostname
@echo -c cmd sets the command to be used by ftp
@echo -d dir sets the directory to be used by ftp
@echo -f ftpopt sets the ftp options
@echo -p pwd sets the password for uid

:end

endlocal
