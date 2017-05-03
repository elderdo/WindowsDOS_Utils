@echo off
rem Author: Douglas Elder
rem Revision 1.0
rem Date: 12 Sep 2014
rem 
rem Desc: run sqlldr 
rem
rem Required Param: sqlldr_ctl_file sqlldr_data_file
rem sqlldr will prompt you for a password
rem 
rem To print the Usage string enter: runSqlldr.bat ?
rem 
rem
rem Rev 1.0 12 Sep 2014 initial rev
rem Rev 1.1 18 Sep 2014 added param1 (ctl) and parm2 (data) optfile overrides

if "%1"=="?" goto usage

@echo start of runSqlldr at %DATE% %TIME%


setlocal EnableDelayedExpansion

set OPTFILE=sqlldrDefaults.txt
set PWD=

:loop
if "%1"=="-d" goto SetDebug
if "%1"=="-e" goto setEnv
if "%1"=="-h" goto Usage
if "%1"=="-o" goto setOptFile
if "%1"=="-u" goto setUid

if not exist %OPTFILE% goto noOptFile

for /f "eol=;" %%A in (%OPTFILE%) do (
	set %%A
)

rem command line options take precedence
rem over the OPTFILE
if not "%1"=="" set CTL_FILE=%1
if not "%2"=="" set DATA_FILE=%2

if not DEFINED ORACLE_HOME goto oraHomeNotDef
if not DEFINED HOST_STRING goto hostStrNotDef
if not DEFINED CTL_FILE goto ctlNotDef
if not DEFINED DATA_FILE goto dataNotDef

if not exist %ORACLE_HOME%\NUL goto badOraHome
set TNS_ADMIN=%ORACLE_HOME%\network\admin
if not exist %TNS_ADMIN%\NUL goto badOraTnsAdmin
set UID=%USERNAME%

if not DEFINED APPNAME set APPNAME=%CTL_FILE:~0,-4%

if not exist %CTL_FILE% goto ctlNotExist
if not exist %DATA_FILE% goto dataNotExist

echo running sqlldr ...
if "%PWD%"=="" set DBCONNECT=%UID%@%HOST_STRING%
if NOT "%PWD%"=="" set DBCONNECT=%UID%@%HOST_STRING%/%PWD%

%ORACLE_HOME%\bin\sqlldr %DBCONNECT% ^
  control=%CTL_FILE% data=%DATA_FILE% log=%APPNAME% bad=%APPNAME%
 

if errorlevel 0 goto processed
if errorlevel 2 goto sqlldrWarn
call :abort "sqlldr failed" %errorlevel%
goto end

:processed
goto end

:sqlldrWarn 
@echo "sqlldr finished but had some warnings - check %APPNAME%.log"
goto end


:setOptFile
shift
if "%1"=="" goto Usage
set OPTFILE=%1
shift
goto loop

:setEnv
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


:SetDebug
shift
@echo on
goto loop

:abort
@echo %1
exit /B %2
goto end


:badOraHome
@echo."%ORACLE_HOME% does not exist"
goto:eof

:badOraTnsAdmin
@echo."%TNS_ADMIN% does not exist"
goto badReturn

:ctlNotDef
@echo."CTL_FILE was not defined in %OPTFILE%"
goto badReturn

:dataNotDef
@echo."DATA_FILE was not defined in %OPTFILE%"
goto badReturn

:noOptFile
@echo."%OPTFILE% does not exist"
goto:eof

:hostStrNotDef
@echo."HOST_STRING was not defined in %OPTFILE%"
goto badReturn

:oraHomeNotDef
@echo."ORACLE_HOME was not defined in %OPTFILE%"
goto badReturn

:ctlNotExist
@echo."%CTL_FILE% does not exist"
goto badReturn

:dataNotExist
@echo."%DATA_FILE% does not exist"
goto badReturn

:batReturn
exit /b 4

:usage
@echo "Usage: runSqlldr.bat [ -c dbconnection_file ]"
@echo "            [ -d ]" 
@echo "            [ -e db0093d1 or db0093t1 or db0093p1 ]" 
@echo "            [ -o Optfile ]"
@echo "            [ -u OracleUserId ]"
@echo "            sqlldr_ctl_file sqlldr_data_file"
@echo "where "
@echo "        -c dbconnection_file is the encrypted"
@echo "           file that contains"
@echo "           all the Oracle connection info"
@echo "           userid@TNSNAME/pwd"
@echo "           - default is DBCONNECTION.dat"
@echo "           "it can be encrypted with xor-crypt.exe key inputFile outputFile"
@echo.
@echo "        -d turn on debug for this script"
@echo "        -e env where env is one of the following db0093d1, db0093t1, or db0093p1 ( default is db0093d1 )"
@echo "        -o Optfile - where Optfile contains ORACLE_HOME, HOST_STRING, CTL_FILE. amd DATA_FILE"
@echo "        -u OracleUserId - the default is the current Windows user"
exit /b 4


:end
@echo end of runSqlldr at %DATE% %TIME%

endlocal
