@echo off
rem Author: Douglas Elder
rem Revision 1.0
rem Date: 12 Sep 2014
rem 
rem Desc: run sqlplus with a predefined script
rem that optionally can accept up to 4 parameters via
rem &1, &2, &3, and &4
rem
rem To print the Usage string enter: runsplplus.bat ?
rem 
rem
rem Rev 1.0 12 Sep 2014 initial rev

if "%1"=="?" goto usage



setlocal EnableDelayedExpansion

rem allow four parameters to be passed to the
rem sqlplus script where &1 will be PARAM1, &2 will be PARAM2,
rem &3 will be PARAM3, and &4 will be PARAM4
set PARAM1=
set PARAM1=
set PARAM1=
set PARAM1=
set SQLPLUSOPT=

set OPTFILE=sqlplusDefaults.txt
set PWD=

:loop
if "%1"=="-d" goto SetDebug
if "%1"=="-e" goto setEnv
if "%1"=="-h" goto Usage
if "%1"=="-o" goto setOptFile
if "%1"=="-s" goto SetScript
if "%1"=="-u" goto setUid

if not exist %OPTFILE% goto noOptFile

for /f "eol=;" %%A in (%OPTFILE%) do (
	set %%A
)

if not DEFINED ORACLE_HOME goto oraHomeNotDef
if not DEFINED HOST_STRING goto hostStrNotDef
if not DEFINED SQLPLUS_SCRIPT goto scriptNotDef

if not exist %ORACLE_HOME%\NUL goto badOraHome
set TNS_ADMIN=%ORACLE_HOME%\network\admin
if not exist %TNS_ADMIN%\NUL goto badOraTnsAdmin
set UID=%USERNAME%

if not "%SQLPLUS_SCRIPT%"=="" (
  if not exist "%SQLPLUS_SCRIPT%" (
    call :abort "%SQLPLUS_SCRIPT% sqlplus script file does not exist" 4
    goto Usage
  ) else (
    set SQLPLUS_SCRIPT=@%SQLPLUS_SCRIPT%
  )
)



if "%SQLPLUSOPT%" NEQ "-s" (
  @echo start of runsplplus at %DATE% %TIME%
  @echo running sqlplus ...
)  
%ORACLE_HOME%\bin\sqlplus %SQLPLUSOPT% %UID%@%HOST_STRING%/%PWD% %SQLPLUS_SCRIPT% ^
  %PARAM1% %PARAM2% %PARAM3% %PARAM4%
 

if errorlevel 0 goto processed
if errorlevel 2 goto sqlplusWarn
call :abort "sqlplus failed" %errorlevel%
goto end

:processed
goto end

:sqlplusWarn 
@echo "sqlplus finished but had some warnings - check %APPNAME%.log"
goto end

:setScript
shift
if "%1"=="" goto Usage
set SQLPLUS_SCRIPT=%1
shift
goto loop

:setUid
shift
if "%1"=="" goto Usage
set UID=%1
shift
goto loop

:setEnv
shift
if "%1"=="" goto Usage
set HOST_STRING=%1
shift
goto loop

:setOptFile
shift
if "%1"=="" goto Usage
set OPTFILE=%1
shift
goto loop


:SetDebug
shift
@echo on
goto loop

:abort
@echo %1
exit /B %2
goto end

:scriptNotDef
@echo.SQLPLU_SCRIPT was not defined in %OPTFILE%"
goto:eof

:hostStrNotDef
@echo.HOST_STRING was not defined in %OPTFILE%"
goto:eof

:oraHomeNotDef
@echo.ORACLE_HOME was not defined in %OPTFILE%"
goto:eof

:badOraHome
@echo."%ORACLE_HOME% does not exist"
goto:eof

:badOraTnsAdmin
@echo."%TNS_ADMIN% does not exist"
goto:eof

:noOptFile
@echo."%OPTFILE% does not exist"
goto:eof

:usage
@echo "Usage: runsqlplus.bat 
@echo "            [ -d ]" 
@echo "            [ -e db0093d1 or db0093t1 or db0093p1 ]" 
@echo "            [ -o OptFile ]"
@echo "            [ -s ScriptFile ]"
@echo "            [ -u OracleUserId ]"
@echo "where "
@echo.
@echo "        -d turn on debug for this script"
@echo "        -e env where env is one of the following db0093d1, db0093t1, or db0093p1 ( default is db0093d1 )"
@echo "        -o OptFile - this contains the file for setting up sqlplus options"
@echo "        -s ScriptFile - this is an sqlplus script file which is optional"
@echo "        -u OracleUserId - the default is the current Windows user"
exit /b 4


:end
if "%SQLPLUSOPT%" NEQ "-s" (
  @echo end of runsplplus at %DATE% %TIME%
)

endlocal
