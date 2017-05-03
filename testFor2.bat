@echo on
setlocal enableextensions enabledelayedexpansion

set ORACLE_HOME=C:\Oracle\12cR1client64bit
set PWD=
if not EXIST %ORACLE_HOME%\NUL goto oraHomeErr

set BIN=%ORACLE_HOME%\bin
if not EXIST %BIN%\NUL goto oraBinErr

set TNS_ADMIN=%ORACLE_HOME%\network\admin
if not EXIST %TNS_ADMIN%\NUL goto oraTnsErr

set PATH=%BIN%\bin;%PATH%

:: set default connection
set HOST_STRING=stl_descm
set UID=spotnkritly

set OPT_FILE=stl_descm.txt


:: a command line argument
@echo on
if EXIST %OPT_FILE% (
for /f "tokens=* eol=;" %%A in (%OPT_FILE%) do (
    echo A=%%A
	  set %%A
  )
)

endlocal
