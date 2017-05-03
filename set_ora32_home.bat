:: set_ora32_home.bat
:: Author: Douglas S. Elder
:: Date: 9/14/2012
:: Desc: This script sets the ORACLE_HOME environment variable
:: On my PC 64 bit oracle is at c:\oracle\11gR2client64bit
:: On my PC 32 bit oracle is at c:\oracle\11gR2client32bit
:: The format or the ora32_home.txt file is:
:: ORACLE_HOME=path
:: where path is the absolute path that is the parent directory
:: to the bin and network directories
:: i.e. ORACLE_HOME= c:\oracle\11gR2client32bit
:: if ora32_home.txt does not exist it defaults to the above
:: example
@echo off

if not defined HOME set HOME=%USERPROFILE%
:: get ORACLE_HOME from the file ora32_home.txt
set CNTLFILE=%HOME%\Documents\DOS\ora32_home.txt
if not exist %CNTLFILE% goto setDefault

for /f "usebackq delims=" %%A in (%HOME%\Documents\DOS\ora32_home.txt) do (
  set %%A
)

if defined ORACLE_HOME goto done

:setDefault
set ORACLE_HOME=c:\oracle\11gR2client32bit

:done
