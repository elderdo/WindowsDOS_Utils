@echo off

rem SetVariableToOutput.bat
rem 2008-06-06
rem Chieh Cheng
rem http://www.CynosureX.com/

rem GNU General Public License (GPL), Version 2, June 1991

  call SetNumberOfArguments.bat %*

  if %NumberOfArguments% == 0 goto :help

  set quickTmp=%~n0.quick.tmp
  call GetTempPathName.bat %~n0 .exec.bat > %quickTmp% 
  set /p SVTO_tempExec=< %quickTmp%
  call GetTempPathName.bat %~n0 .tmp > %quickTmp%
  set /p SVTO_tempFile=< %quickTmp%
  del %quickTmp%
  set quickTmp=

  set OutputVariable=
  set cmd=cmd /c %*
  echo %cmd% > %SVTO_tempExec%
  call %SVTO_tempExec% > %SVTO_tempFile%
  set /p OutputVariable=< %SVTO_tempFile%
  del %SVTO_tempFile%
  del %SVTO_tempExec%

  goto :end

:help
  echo   Usage: %~n0%~x0 command

:end

