@echo off
:: vim: ts=2:sw=2:sts=2:et:syntax=dosbatch
:: execSqlplus.bat
:: Author: Douglas S. Elder
:: Date: 10/16/2014
:: Desc: Run sqlplus 
:: scripts 
:: An optional command line argument
:: specifying what script to be executed
:: can be used

setlocal enableextensions enabledelayedexpansion

:: Tell sqlplus it can find
:: scripts in the current directory
:: this may be overridden
:: in the dbConnect.txt file
set ORACLE_PATH=%CD%

set ORACLE_HOME=c:\Oracle\11gR202Client64bit
if not EXIST %ORACLE_HOME%\NUL goto oraHomeErr
set BIN=c:\Oracle\11gR202Client64bit\bin
if not EXIST %BIN%\NUL goto oraBinErr
set TNS_ADMIN=%ORACLE_HOME%\network\admin
if not EXIST %TNS_ADMIN%\NUL goto oraTnsErr
set PATH=%BIN%\bin;%PATH%

set SCRIPT=
:: if there is a command line argument
:: use that for the script to execute
if not "%1"=="" (
  set SCRIPT=%1
)

:: set default connection
set HOST_STRING=RMADP
set UID=%USERNAME%
set DBCONNECT=%UID%@%HOST_STRING%

:: see if there is a file
:: containing DBCONNECT=userid@host_string/password
:: or just DBCONNECT=userid@host_string
:: if there is use it to connect
:: to Oracle
:: The file may contain comments if the
:: line starts with a semicolon.
:: It can also tell sqlplus where to
:: find scripts by setting
:: the ORACLE_PATH environment variable
:: to the path containing the script 
:: Also, this file may contain the name
:: of a script to execute:
:: SCRIPT=myscript.sql
:: this file will take priority over 
:: a command line argument
if EXIST dbConnect.txt (
for /f "eol=;" %%A in (dbConnect.txt) do (
	  set %%A
  )
)


:: if there is a script to 
:: execute, make sure it exists
:: and add the @ at the beginning 
:: of the file name
if not "%SCRIPT%"=="" (
  if EXIST %ORACLE_PATH%\%SCRIPT% (
    set SCRIPT=@%SCRIPT%
  ) else (
    goto oraScriptErr
  )
) 

set RC=
%BIN%\sqlplus %DBCONNECT% %SCRIPT%
set RC=%ERRORLEVEL%
if "%RC%"=="0" (
  @echo.sqlplus has successfully executed
) else (  
  @echo.sqlplus did not run successfully
)
goto:done

:oraHomeErr
@echo.Cannot find directory %ORACLE_HOME%
goto:done

:oraBinErr
@echo.Cannot find directory %BIN%
goto:done

:oraTnsErr
@echo.Cannot find directory %TNS_ADMIN%
goto:done

:oraScriptErr
@echo.Cannot find sqlplus script %SCRIPT%
goto:done

endlocal

:done
pause
