:: odbc32.bat
:: Author: Douglas S. Elder
:: Date: 6/4/2012
:: Desc: Run the 32 bit ODBC driver setup tool

@echo on
setlocal
call set_ora32_home
@echo.ORACLE_HOME=%ORACLE_HOME%
for %%i in (%ORACLE_HOME%) do set ORAHOME_SHORT_NAME=%%~si
IF NOT EXIST %ORAHOME_SHORT_NAME%\NUL GOTO noOraHomeDIR
set PATH=C:\Windows\System32;%ORAHOME_SHORT_NAME%\bin;c:\msys\bin
IF NOT EXIST %ORAHOME_SHORT_NAME%\bin\NUL GOTO noOraBinDIR
set TNS_ADMIN=%ORAHOME_SHORT_NAME%\network\admin
echo TNS_ADMIN=%TNS_ADMIN%
IF NOT EXIST %TNS_ADMIN%\NUL GOTO noOraTnsDIR

which tnsping
tnsping db0093p1

@echo off
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
  @echo.starting 32 bit ODBC driver setup on a 64 bit machine
  start %windir%\SysWow64\odbcad32.exe
) else (
  start %windir%\System32\odbcad32.exe
)
endlocal
