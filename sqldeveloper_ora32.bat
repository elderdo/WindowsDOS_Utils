:: msaccess_ora32.bat
:: Author: Douglas S. Elder
:: Date: 9/14/2012
::
:: 10/17/2012 added parameter for file name
::
:: 5/2/2017   Changed method of finding Oracle's home
:: directory. The script now assumes that Software Express
:: has installed the Oracle client software under C:\Oracle
::
:: Desc: This script makes sure 32 bit Oracle is found first
:: via the PATH variable
:: It also sets up the ORACLE_HOME and TNS_ADMIN environment variables
:: for the 32 bit directory
:: It runs msaccess in this environment
@echo off

setlocal
set MSACCESS="C:\Program Files (x86)\Microsoft Office\Office15\MSACCESS"
if not EXIST %MSACCESS%.exe goto noMsAccess
for %%i in (%MSACCESS%) do set MSACCESS_SHORT_NAME=%%~si

if not EXIST C:\Oracle\NUL goto noOracle

:: find the lastest 32 bit directory for Oracle
for /f "tokens=*" %%a in ('dir /b /od C:\Oracle\11*32*') do set newest=%%a
set ORACLE_HOME=C:\Oracle\%newest%

for %%i in (%ORACLE_HOME%) do set ORAHOME_SHORT_NAME=%%~si

IF NOT EXIST %ORAHOME_SHORT_NAME%\NUL GOTO noOraHomeDIR
set PATH=%ORAHOME_SHORT_NAME%\bin;%WINDIR%\system32;c:\MSYS\bin
echo PATH=%PATH%
IF NOT EXIST %ORAHOME_SHORT_NAME%\bin\NUL GOTO noOraBinDIR
set TNS_ADMIN=%ORAHOME_SHORT_NAME%\network\admin
IF NOT EXIST %TNS_ADMIN%\NUL GOTO noOraTnsDIR

START %MSACCESS_SHORT_NAME% %1
goto:eof

:noOraHomeDir
@echo.%ORACLE_HOME% does not exist on your computer
pause
goto:eof

:noOraBinDir
@echo.%ORACLE_HOME%\bin does not exist
pause
goto:eof

:noOraTnsDir
@echo done.%TNS_ADMIN% does not exist
pause
goto:eof

:noMsAccess
@echo.%MSACCESS%.EXE does not exist"
pause
goto:eof

:noOracle
@echo C:\Oracle does not exist on your computer
pause
goto:eof

:done
endlocal

