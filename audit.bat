:: Desc: - help do audits of AMD files using the prod Unix server
:: and Clear Case
:: Written by: Douglas S. Elder
:: Date written: 10/14/2011
::
@echo off
setlocal enabledelayedexpansion
set UNIX_DIR=src
set LABEL=SDS-AMD-PROD
set SKIP=
set CC_Drive=M:
set CC_VIEW=%CC_Drive%\zf297a_view
set VOB=SDS-AMD
set VOB_PATH=Components-ClientServer\AmdLoad



:loop
if "%1"=="-d" goto setDirectory
if "%1"=="-l" goto setLabel
if "%1"=="-f" goto setSkip
if "%1"=="-x" goto setDebug
if "%1"=="-w" goto setVOBView
if "%1"=="-c" goto setCCDrive
if "%1"=="-v" goto setVOB
if "%1"=="-p" goto setVOBPath


if "%1"=="" goto usage
if "%2"=="" goto usage
if "%SKIP%"=="Y" goto findStep

call :procfile %1
if "%ename%"=="ksh" set UNIX_DIR=lib
if "%ename%"=="ksh" set VOB_DIR=Scripts
if "%ename%"=="properties" set UNIX_DIR=lib
if "%ename%"=="properties" set VOB_DIR=properties
if "%ename%"=="ctl" set UNIX_DIR=src
if "%ename%"=="ctl" set VOB_DIR=Ctl
if "%ename%"=="sql" set UNIX_DIR=src
if "%ename%"=="sql" set VOB_DIR=Sql

set WorkDir=%CC_VIEW%\%VOB%\%VOB_PATH%
if not "%VOB_DIR%"=="" set WorkDir=%CC_VIEW%\%VOB%\%VOB_PATH%\%VOB_DIR%
if not "%CD%"==%WorkDir% cd /d %WorkDir%

@echo File: %1
@echo Last changed: %2
:: get yy month and day from date variable
:: NOTE - this must be done outside of an if block
set dt=%date:~4%
set yy=%dt:~6%
set mm=%dt:~0,2%
set dd=%dt:~3,2%

:: make sure the file is not already checked out and
:: keep any file that may have been recently updated
call ct.bat unco -keep %1 > NUL 2>&1
call ct.bat co -nc %1 > NUL 2>&1
if NOT %ERRORLEVEL%==0 (
	@echo %1 not in ClearCase
	call ftpFile.bat -c get -d %UNIX_DIR% %1
	if not exist %1 (
		@echo.Unable to download %1 via ftp.  You must correct %1 manually
		goto endAudit
	)
	call ct.bat co -nc .
	call ct.bat mkelem -elt text_file -c "Prod version setup" -ci %1 > %TEMP%\%1_log.txt
	findstr "Created element" %TEMP%\%1_log.txt
	if %%ERRORLEVEL%%==0 (
		call ct.bat unco .
		call ct.bat mklabel -replace SDS-AMD-PROD %1
		@echo Corrected: %mm%/%dd%/%yy%
		call ct.bat lshistory %1
	) else (
		@echo Unable to mkelem %1.  You must correct %1 manually
	)
	goto endAudit
)
call ftpFile.bat -c get -d %UNIX_DIR% -e prod.txt %1
call ct.bat diff -pred %1 > NUL
::@echo.diff errorlevel=%ERRORLEVEL%

:findStep
::findstr  "identical" %TEMP%\diff.txt
if %ERRORLEVEL%==0 (
	@echo Match with ClearCase: yes
	call ct.bat unco -rm %1 > NUL
	call ct.bat mklabel -replace %LABEL% %1 > NUL
	call ct.bat lshistory %1
) else (
	@echo Match with ClearCase: no
	call beep.bat
	call CCnoMatch.bat %1 %UNIX_DIR%
)
:endAudit
@echo.
goto done


:procfile
    set fname=%1
    set ename=
:loop1
    if "%fname%"=="" (
        set ename=
        goto :exit1
    )
    if not "%fname:~-1%"=="." (
        set ename=%fname:~-1%%ename%
        set fname=%fname:~0,-1%
        goto :loop1
    )
:exit1
    
goto :eof

:setDebug
shift
@echo on
goto loop

:setDirectory
shift
if "%1"=="" goto usage
set UNIX_DIR=%1
shift
goto loop

:setLabel
shift
if "%1"=="" goto usage
set LABEL=%1
shift
goto loop

:setSkip
shift
set SKIP=Y
goto loop

:setVOBView
shift
if "%1"=="" goto usage
set CC_VIEW=%1
shift
goto loop

:setCCDrive
shift
if "%1"=="" goto usage
set CC_Drive=%1
shift
goto loop

:setVOB
shift
if "%1"=="" goto usage
set VOB=%1
shift
goto loop

:setVOBPath
shift
if "%1"=="" goto usage
set VOB_PATH=%1
shift
goto loop


:usage
@echo Usage: audit.bat [-d server_directory -l label -v VOB -w VOBVIEW -c CCDrive -p VOBPath] filename last_changed_date
@echo where switches -d, -l, are optional and must precede filename
@echo       -d server directory - default is src
@echo       -l label - default is SDS-AMD-PROD
@echo       -v VOB - default is SDS-AMD
@echo       -w VOBVIEW - default is zf297a_view
@echo       -c CCDrive - default is M:
@echo       -p VOBPATH - default is Components-ClientServer\AmdLoad
@echo For example:
@echo.
@echo audit.bat -d src loadFmsDemands.sql
@echo executes the script and uses server directory /apps/CRON/AMD/src and
@echo label SDS-AMD-PROD
goto done

:done
endlocal
