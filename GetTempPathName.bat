@echo off

rem GetTempPathName.bat
rem 2008-07-09
rem Chieh Cheng
rem http://www.CynosureX.com/

rem GNU General Public License (GPL), Version 2, June 1991

  setlocal
  call SetNumberOfArguments.bat %*

  if %NumberOfArguments% lss 1 goto :help
  if %NumberOfArguments% gtr 3 goto :help

  set prefix=%1
  set suffix=%2
  set directory=%3

  if "%suffix%" == "" set suffix=.tmp
  if "%directory%" == "" set directory=%temp%
  if "%directory%" == "" set directory=%~d0%~p0

:loop
  set i=%random%
  set pathName=%directory%\%prefix%%i%%suffix%
  if exist "%pathName%" goto :loop

  echo > "%pathName%"
  echo "%pathName%"

  goto :end

:help
  echo   Usage: %~n0%~x0 "prefix" ["suffix"] ["directory"]

:end

