:: bssm_ora32.bat
:: Author: Douglas S. Elder
:: Date: 12/04/2013
:: Desc: This script makes sure 32 bit Oracle is found first
:: via the PATH variable
:: It also sets up the ORACLE_HOME and TNS_ADMIN environment variables
:: for the 32 bit directory
:: It runs the best spares app
:: On my PC 64 bit oracle is at c:\oracle\11gR2client64bit
:: On my PC 32 bit oracle is at c:\oracle\11gR2client32bit
:: You may need to use the MS Access "Linked Table Manager" to connect with
:: any linked table
@echo off

setlocal
set BSSM="C:\Users\zf297a\Documents\BestSpares\BestSpares_6_4_1_28"
for %%i in (%BSSM%) do set BSSM_SHORT_NAME=%%~si

call set_ora32_home
for %%i in (%ORACLE_HOME%) do set ORAHOME_SHORT_NAME=%%~si

IF NOT EXIST %ORAHOME_SHORT_NAME%\NUL GOTO noOraHomeDIR
set PATH=%ORAHOME_SHORT_NAME%\bin;%WINDIR%\system32;c:\MSYS\bin
echo PATH=%PATH%
IF NOT EXIST %ORAHOME_SHORT_NAME%\bin\NUL GOTO noOraBinDIR
set TNS_ADMIN=%ORAHOME_SHORT_NAME%\network\admin
IF NOT EXIST %TNS_ADMIN%\NUL GOTO noOraTnsDIR

if not EXIST %BSSM%.exe goto noBSSM

START %BSSM_SHORT_NAME% %1
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

:noBSSM
@echo.%BSSM%.EXE does not exist"
goto done

:done
endlocal
