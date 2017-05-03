@echo on
set TYPE=sql
set DIR=src
set DIFFLIST=%TEMP%\diffList.txt
set WKDIR=tmp
:loop
if "%1"=="-t" goto setType
if "%1"=="-d" goto setDir


setlocal enabledelayedexpansion
if not exist %WKDIR%\nul mkdir %WKDIR%
rm -f %WKDIR%/*.%TYPE%
if exist %DIFFLIST% del %DIFFLIST%
for %%F in (*.%TYPE%) do (
  scp -q ussevm89.cs.boeing.com:/apps/CRON/AMD/%DIR%/%%F %WKDIR%/%%F 2>&1 >> %DIFFLIST%
  diff -q -w %%F %WKDIR%\%%F 2>&1 >> %DIFFLIST%
  if EXIST %WKDIR%\%%F rm -f %WKDIR%/%%F  
)
goto done

:setType
shift
if "%1"=="" goto Usage
set TYPE=%1
shift
goto loop

:setDir
shift
if "%1"=="" goto Usage
set DIR=%1
shift
goto loop

:Usage
@echo compareCCToProd.bat [ -t TYPE -d DIR ]
@echo where -t sets the file extension type ( default is sql )
@echo where -d sets the AMD director ( default is src )

:done
rm -f %TEMP%\*.*
if EXIST %TEMP%\diffList.txt start NOTEPAD %TEMP%\diffList.txt

endlocal
