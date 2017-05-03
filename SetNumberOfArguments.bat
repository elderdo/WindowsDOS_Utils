@echo off

rem SetNumberOfArguments.bat
rem 2008-05-19
rem Chieh Cheng
rem http://www.CynosureX.com/

rem GNU General Public License (GPL) Version 2, June 1991

  set NumberOfArguments=0
  call :loop %*
  goto :end

:loop
  if ?%1? == ?? goto :end
  shift
  set /a NumberOfArguments += 1
  goto :loop

:end

