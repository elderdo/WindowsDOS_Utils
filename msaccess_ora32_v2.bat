:: msaccess_ora32.bat
:: Author: Douglas S. Elder
:: Date: 9/14/2012
:: 10/17/2012 added parameter for file name
:: Desc: This script makes sure 32 bit Oracle is found first
:: via the PATH variable
:: It also sets up the ORACLE_HOME and TNS_ADMIN environment variables
:: for the 32 bit directory
:: It runs msaccess in this environment
:: On my PC 64 bit oracle is at c:\oracle\11gR2client64bit
:: On my PC 32 bit oracle is at c:\oracle\11gR2client32bit
:: You may need to use the MS Access "Linked Table Manager" to connect with
:: any linked table
@echo off

setlocal
set MSACCESS="C:\Program Files (x86)\Microsoft Office\Office15\MSACCESS"
for %%i in (%MSACCESS%) do set MSACCESS_SHORT_NAME=%%~si

call set_ora32_home
for %%i in (%ORACLE_HOME%) do set ORAHOME_SHORT_NAME=%%~si

IF NOT EXIST %ORAHOME_SHORT_NAME%\NUL GOTO noOraHomeDIR
set PATH=%ORAHOME_SHORT_NAME%\bin
echo PATH=%PATH%
IF NOT EXIST %ORAHOME_SHORT_NAME%\bin\NUL GOTO noOraBinDIR
set TNS_ADMIN=%ORAHOME_SHORT_NAME%\network\admin
IF NOT EXIST %TNS_ADMIN%\NUL GOTO noOraTnsDIR

if not EXIST %MSACCESS%.exe goto noMsAccess

START %MSACCESS_SHORT_NAME% %1
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

:noMsAccess
@echo.%MSACCESS%.EXE does not exist"
goto done

:done
endlocal
