@echo off
echo %0
echo %~d0
echo %~p0
echo %~dp0
echo %~x0
echo %~s0
echo %~sp0
echo." "

call setPath.bat %TEMP%\myPath.txt
echo "test: %PATH%"

set PATH=
call setPath.bat test.txt
echo "test: %PATH%"

