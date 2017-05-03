@echo off
call :procfile %1
goto :eof

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
    echo.%ename%
    goto :eof

