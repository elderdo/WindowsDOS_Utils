:: compareIntegratedNprod.bat
:: Author: Douglas S. Elder
:: Date: 1/14/2014
:: Desc: Compare counts for integrated test and prod
:: for AMD & BSSM tables
:: NOTE: the Oracle account used must exist in both env's
:: and have the same password
::
:: Rev 1.0 1/7/2014 initial release
:: Rev 1.1 1/13/2014 added bssm tables
:: Rev 1.2 1/14/2014 added -d and -s options
::
@echo off
setlocal DISABLEDELAYEDEXPANSION

set UID=%USERNAME%
set ENV=db0093t1
set ENV1=integrated

rem get the short name for the gvim editor
for %%i in ("c:\Program Files (x86)\Vim\vim73\gvim.exe") do set EDITOR=%%~si
rem use notepad if gvim does not exist
if not exist %EDITOR% set EDITOR=notepad

set SQLPATH=%HOMEDRIVE%%HOMEPATH%\Documents\sql
rem see if the sql directory exists and use the current 
rem directory if it doesn't
if not EXIST %SQLPATH%\NUL set SQLPATH=.
set DOS=%HOMEDRIVE%%HOMEPATH%\Documents\Dos
if not EXIST %DOS%\NUL set DOS=.  

:loop
if "%1"=="-u" goto setUid
if "%1"=="-d" goto setEnv
if "%1"=="-s" goto setScript

rem set the ORACLE_HOME env variable
if EXIST %DOS%\set_ora32_home.bat (
 call %DOS%\set_ora32_home.bat
)
if not DEFINED ORACLE_HOME (
  if EXIST .\orahome.txt (
    for /f "usebackq delims=" %%A in (.\orahome.txt) do (
      set %%A
    )
  ) else (
    set ORACLE_HOME=c:\oracle\11gR2client64bit
  )
)
for %%i in (%ORACLE_HOME%) do set ORAHOME_SHORT_NAME=%%~si
if not EXIST %ORAHOME_SHORT_NAME%\NUL goto OraHomeErr
echo ORACLE_HOME=%ORACLE_HOME% > orahome.txt
set ORABIN=%ORAHOME_SHORT_NAME%\bin
IF NOT EXIST %ORABIN%\NUL GOTO noOraBinDIR
rem make sure the Oracle bin directory occurs first in
rem the search PATH env variable
set PATH=%ORABIN%;%PATH%
rem make sure the tns files can be found
set TNS_ADMIN=%ORAHOME_SHORT_NAME%\network\admin
IF NOT EXIST %TNS_ADMIN%\NUL GOTO noOraTnsDIR

rem make sure sqlplus is installed
if not EXIST %ORABIN%\sqlplus.exe goto noSQLPLUS

set SCRIPT=compareEnvWithProd.sql
if not EXIST %SCRIPT% if not EXIST %SQLPATH%\%SCRIPT% goto noScript

@echo.ORACLE_HOME=%ORACLE_HOME%
sqlplus %UID%@%ENV% @%SCRIPT% %ENV1%
%EDITOR% diff_rpt.txt
goto done

:OraHomeErr
@echo.%ORACLE_HOME% does not exist
@echo.create a file called orahome.txt
@echo.with the following
@echo.ORACLE_HOME=c:\oracle\11gR2client64bit
@echo.where this is the directory containing
@echo.bin\sqlplus
@echo.and
@echo.network\admin
@echo.place the orahome.txt file in the same
@echo.directory as this script
goto done

:setUid
shift
if "%1"=="" goto missingUid
set UID=%1
shift
goto loop

:setScript
shift
if "%1"=="" goto missingScript
set SCRIPT=%1
shift
goto loop

:missingScript
@echo.You must specifiy a sqlplus script file
goto Usage

:setEnv
shift
set ENV=db0093d1
set ENV1=development
goto loop

:missingEnv
@echo.Missing env
goto Usage

:missingUid
@echo.Missing user id
goto Usage

:noSetOraHome
@echo.%DOS%\set_ora32_home.bat does not exist
goto done

:noScript
@echo.%SCRIPT% does not exist
goto done

:noOraHomeDir
@echo.%ORACLE_HOME% does not exist
goto done

:noOraBinDir
@echo.%ORACLE_HOME%\bin does not exist
goto done

:noOraTnsDir
@echo.%TNS_ADMIN% does not exist
goto done

:noSQLPLUS
@echo.%SQLPLUS%.EXE does not exist"
goto done

:Usage
@echo.Usage compareIntegratedNprod.bat [-d ] [-s script] [-u userid ] 
@echo.where -d says to use the development environment 
@echo.and   -s script specifies the sqlplus script to execute (default is compareIntegratedNprod.sql)
@echo.and   -u userid is an Oracle id other than %USERNAME%

:done
endlocal

