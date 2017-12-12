:: netbeans_ora32.bat
:: Author: Douglas S. Elder
:: Date: 8/8/2017
:: Rev: 1.0
:: Desc: This script makes sure 64 bit Oracle is found first
:: via the PATH variable
:: It also sets up the ORACLE_HOME and TNS_ADMIN environment variables
:: for the 32 bit directory
:: It runs netbeans in this environment
:: On my PC 64 bit oracle is at c:\oracle\11gR202Client64bit
:: You may need to use the MS Access "Linked Table Manager" to connect with
:: any linked table
:: 8/8/2017 Rev 1.0  D. Elder initial rev
@echo off

setlocal
set ORACLE_HOME=c:\oracle\11gR202client64bit
set TNS_ADMIN=%ORACLE_HOME%\network\admin
set PATH=%ORACLE_HOME%\lib;%ORACLE_HOME%\bin
@echo.ORACLE_HOME=%ORACLE_HOME%
@echo.PATH=%PATH%
@echo.TNS_ADMIN=%TNS_ADMIN%
IF NOT EXIST %TNS_ADMIN%\NUL GOTO noOraTnsDIR
set EXE="C:\Program Files\NetBeans 8.2\bin\netbeans64.exe"

if not EXIST %EXE%  goto noExe
%EXE%
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

:noExe
@echo."%EXE% does not exist"
goto done

:done
endlocal
