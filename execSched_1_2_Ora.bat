@echo off
:: vim: ts=2:sw=2:sts=2:et:syntax=dosbatch
:: execSched_1_2_Ora.bat
:: Author: Douglas S. Elder
:: Date: 01/22/2015
:: Desc: Run Sched_1_2_Ora 
::
:: Set up the env variables to run
:: the Sched_1_2_Ora.exe

setlocal enableextensions enabledelayedexpansion

set ORACLE_HOME=c:\Oracle\11gR202Client64bit
if not EXIST %ORACLE_HOME%\NUL goto oraHomeErr

set BIN=c:\Oracle\11gR202Client64bit\bin
if not EXIST %BIN%\NUL goto oraBinErr

set TNS_ADMIN=%ORACLE_HOME%\network\admin
if not EXIST %TNS_ADMIN%\NUL goto oraTnsErr

set PATH=%BIN%\bin;%PATH%


:loop
if "%1"=="-d" goto setDebug


set RC=
"C:\Users\kk720c\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Global Services and Support for SoCal\Sched_1_2_to_Ora.exe"


set RC=%ERRORLEVEL%
if "%RC%"=="0" (
  @echo.Sched_1_2_Ora has successfully executed
) else (  
  @echo.Sched_1_2_Ora did not run successfully
)
goto:done

:setDebug
shift
@echo on
goto loop

:setOptFile
shift
if "%1"=="" goto Usage
set OPT_FILE=%1
shift
goto loop


:oraHomeErr
@echo.Cannot find directory %ORACLE_HOME%
goto:done

:oraBinErr
@echo.Cannot find directory %BIN%
goto:done

:oraTnsErr
@echo.Cannot find directory %TNS_ADMIN%
goto:done

:Usage
@echo "execSched_1_2_Ora.bat "

endlocal

:done
pause
