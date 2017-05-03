:: ccdiff.bat
:: Date: 11/25/2013
:: Author: Douglas S. Elder
:: Description: Invoke ClearCase's diff
:: command and compare the given file
:: against its predecessor ignoring blanks
:: used for formatting.
:: Rev 1.1 1/27/2014 DSE fixed file name
:: added a command line option to allow
:: for the graphical output window
@echo off
setlocal
set OPT=

:loop
if "%1"=="-d" goto setDebug
if "%1"=="-g" goto setGraphicalOpt
if "%1"=="-h" goto Usage
if "%1"=="" goto Usage

set arg=%1

ct diff %OPT% -pred -options="-blank_ignore" %arg%
goto done

:Usage
@echo.
@echo.Usage: ccdiff [ -d]  [ -g ] [ -h ] element
@echo.where -d tunrs on debugging
@echo.      -g turns on the graphical window output
@echo.      -h displays this usage
@echo.      element is the ClearCase path of the 
@echo.      element being compared to its predecessor
@echo.      with the -blank_ignore option
@echo.
goto done

:setDebug
shift
@echo on
goto loop

:setGraphicalOpt
shift
set OPT=-graphical %OPT%
goto loop

:strlen <resultVar> <stringVar>
(   
    setlocal EnableDelayedExpansion
    set "s=!%~2!#"
    set "len=0"
    for %%P in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
        if "!s:~%%P,1!" NEQ "" ( 
            set /a "len+=%%P"
            set "s=!s:~%%P!"
        )
    )
)
( 
    endlocal
    set "%~1=%len%"
    exit /b
)

:done
endlocal
