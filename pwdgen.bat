:: pwdgen.bat
:: Author: Douglas S. Elder
:: Date: 06/11/2019
:: Desc: Run the password generation utility
:: and generate a password for the specified 
:: pattern. 
@echo off
setlocal enabledelayedexpansion
set PERL_HOME=%SystemDrive%%HOMEPATH%\Documents\perl
set PWDGEN=%PERL_HOME%\pwdgen.pl
set PATTERN=
set CNT=
:loop
if "%1"=="-d" goto setDebug
if "%1"=="-h" goto Usage
if "%1"=="-p" goto setPattern
if "%1"=="-n" goto setCount
if "%PATTERN%"=="" SET PATTERN=llLLccCCvvVVnl
if "%CNT%"== "" SET CNT=1
for /F "tokens=* USEBACKQ" %%F in (`%PWDGEN% %PATTERN% %CNT%`) DO (
  SET var="%%F"
  echo !var!
  echo !var! | clip
)
pause
goto:eof

:Usage
shift
echo.
echo.pwdgen [ -h -n num -p pattern ]
echo.where -h prints this message
echo.      -n num prints num passwords
echo.      -p pattern used by pwdgen.pl
echo.
%PWDGEN%
goto:eof

:setPattern
shift
set PATTERN="%1"
shift
goto loop

:setCount
shift
set CNT=%1
shift
goto loop

:setDebug
shift
@echo on
goto loop


endlocal




