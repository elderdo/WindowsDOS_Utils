@echo off

REM.-- Prepare the Command Processor --

SETLOCAL ENABLEEXTENSIONS

SETLOCAL ENABLEDELAYEDEXPANSION

 

REM.-- Version History –

REM         XX.XXX        YYYYMMDD Author Description
SET version=01.000-beta &:20051201 p.h.   initial version, providing the framework
SET version=01.000      &:20051202 p.h.   framework ready

REM !! For a new version entry, copy the last entry down and modify Date, Author and Description
SET version=%version: =%

 

REM.-- Set the title
SET title=%~nx0 - version %version%
TITLE %title%

 

REM.-- Do something useful
echo.So far so good.
echo.

 

REM.-- End of application
pause

