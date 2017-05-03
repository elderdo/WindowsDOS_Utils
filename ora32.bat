:: msaccess_ora32.bat
:: Author: Douglas S. Elder
:: Date: 9/14/2012
:: 10/17/2012 added parameter for file name
:: Desc: This script makes sure 32 bit Oracle is found first
:: via the PATH variable
:: It also sets up the ORACLE_HOME and TNS_ADMIN environment variables
:: for the 32 bit directory
@echo off

call set_ora32_home
@echo.ORACLE_HOME=%ORACLE_HOME%
for %%i in (%ORACLE_HOME%) do set ORAHOME_SHORT_NAME=%%~si
IF NOT EXIST %ORAHOME_SHORT_NAME%\NUL GOTO noOraHomeDIR
set PATH=%ORAHOME_SHORT_NAME%\bin;%PATH%
IF NOT EXIST %ORAHOME_SHORT_NAME%\bin\NUL GOTO noOraBinDIR
set TNS_ADMIN=%ORAHOME_SHORT_NAME%\network\admin
IF NOT EXIST %TNS_ADMIN%\NUL GOTO noOraTnsDIR

