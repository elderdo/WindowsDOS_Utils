:: getOraHome.bat
:: Author: Douglas S. Elder
:: Date: 4/6/2015
:: Rev 1.0 4/6/2015
:: Rev 1.1 4/14/205 fixed tns_admin
:: Desc: This script sets the ORACLE_HOME environment variable
:: It locates the appropriate 32 bit or 64 bit directory
:: the default is 64 bit
@echo off
if "%1"=="" set BIT=64
if not "%1"=="" set BIT=32

if not defined HOME set HOME=%USERPROFILE%
set ORACLE_DIR=C:\Oracle
if not exist %ORACLE_DIR%\Nul goto noOracleDir
:continue

for /f "delims=" %%A in ('dir /b /d %ORACLE_DIR%\11gR202*%BIT%*') do if not "%%A"=="" set ORACLE_HOME=%ORACLE_DIR%\%%A

if not defined ORACLE_HOME goto done
set TNS_ADMIN=%ORACLE_HOME%\network\admin
if not exist %TNS_ADMIN% echo TNS=ADMIN=%TNS_ADMIN% does not exist & goto done
set BIN=%ORACLE_HOME%\bin
if not exist %BIN% echo TNS=ADMIN=%BIN% does not exist & goto done
set PATH=%BIN%;%PATH%

@echo.ORACLE_HOME=%ORACLE_HOME%
@echo.TNS_ADMIN=%TNS_ADMIN%
@echo.BIN=%BIN%
goto:eof

:noOracleDir
set SCRIPT=%TEMP%\~input.vbs

@echo.SCRIPT=%SCRIPT%
@echo.%ORACLE_DIR% does not exist on this computer
@echo.
if exist %SCRIPT% del %SCRIPT%
@echo.Wscript.Echo Inputbox("Plase enter the Oracle Directory","Input Required","%ORACLE_DIR%",1000,1000) > %SCRIPT%
set ORACLE_DIR=
if exist %SCRIPT% FOR /f "delims=/" %%G IN ('cscript //nologo %SCRIPT%') DO set ORACLE_DIR=%%G
if exist %SCRIPT% del %SCRIPT%
if not exist %ORACLE_DIR% goto done
@echo %ORACLE_DIR% exists
goto continue

:done
@echo.ORACLE_HOME=%ORACLE_HOME%
@echo.TNS_ADMIN=%ORACLE_HOME%
@echo.BIN=%BIN%
