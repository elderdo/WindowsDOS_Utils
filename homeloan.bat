@echo off
setlocal enabledelayedexpansion

if "%1"=="" (
  set OPT=
) else (
  set OPT=+/%1
)
"%USERPROFILE%\My Documents\Home Loan\mortgage.xlsm" 

endlocal
