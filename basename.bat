@echo off

rem basename.bat
rem 2009-02-23
rem Chieh Cheng
rem http://www.CynosureX.com/

rem GNU General Public License (GPL), Version 2, June 1991

  setlocal
  call SetNumberOfArguments.bat %*

  if not %NumberOfArguments% == 1 goto :help

  set memory=
  set DirPath=%~1

:loop
  If "%DirPath%" == "" GoTo :done
  For /F "tokens=1* delims=\" %%a in ("%DirPath%") Do set memory=%%a
  For /F "tokens=1* delims=\" %%a in ("%DirPath%") Do Set DirPath=%%b
  GoTo :loop

:done
  echo %memory%
  goto :end

:help
  echo   Usage:   %~n0%~x0 "path"

:end

