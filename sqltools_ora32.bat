@echo off
Rem SQLTools_ora32.bat
Rem Author: Douglas S. Elder
Rem Date: 01/19/2017
Rem Desc: This script makes sure 32 bit Oracle software is used
Rem since SQLTools is 32 bit software
Rem It also sets up the ORACLE_HOME and TNS_ADMIN environment variables
Rem for the 32 bit Oracle software directory
Rem It runs SQLTools in this environment
Rem On my PC 32 bit oracle is at c:\oracle\11gR2client32bit

setlocal
set SQLTools="C:\Users\zf297a\Apps\SQLTools 1.8\SQLTools"
for %%i in (%SQLTools%) do set SQLTools_SHORT_NAME=%%~si

Rem Need to use the 11gR202Client32bit client for the
Rem correct OLE DB Provider for Oracle
set ORACLE_HOME=C:\Oracle\11gR202Client32bit
@echo starting SQLTools using 32 bit software from %ORACLE_HOME%
Rem use the ping command to force a 5 second delay
ping 127.0.0.1 -n 6 > nul
for %%i in (%ORACLE_HOME%) do set ORAHOME_SHORT_NAME=%%~si

IF NOT EXIST %ORAHOME_SHORT_NAME%\NUL GOTO noOraHomeDIR
set PATH=%ORAHOME_SHORT_NAME%\bin;%WINDIR%\system32
echo PATH=%PATH%
IF NOT EXIST %ORAHOME_SHORT_NAME%\bin\NUL GOTO noOraBinDIR
set TNS_ADMIN=%ORAHOME_SHORT_NAME%\network\admin
IF NOT EXIST %TNS_ADMIN%\NUL GOTO noOraTnsDIR

if not EXIST %SQLTools%.exe goto noSQLTools

@echo ORACLE_HOME=%ORACLE_HOME%
@echo PATH=%PATH%
@echo TNS_ADMIN=%TNS_ADMIN%
dir %TNS_ADMIN%
Rem use the ping command to force a 5 second delay
ping 127.0.0.1 -n 6 > nul

rem %SQLTools_SHORT_NAME% %1
rem use STATE so the DOS command prompt
rem window can close
START %SQLTools_SHORT_NAME% %1
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

:noSQLTools
@echo.%SQLTools%.EXE does not exist"
goto done

:done
endlocal
