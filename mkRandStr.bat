@echo off
setlocal enableDelayedExpansion
set charSet=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^_-
:getSwitches
if "%1"=="-d" goto setDebug
if "%1"=="" set /a countRaw=4+(%random%)%%20
if not "%1"=="" set  countRaw=%1

for /L %%c in (1,1,%countRaw%) do (call :makeRandomStr)
goto:eof

:setDebug
@echo on
shift
goto getSwitches

:makeRandomStr
set buffer=% %
set count=0
set /a lowValue=30+(%randome%)%%40
set /a length=10+!lowValue!

:Loop
set /a count+=1
set /a rand=%Random%%%69
echo rand=%rand%
set buffer=!buffer!!charSet:~%rand%,1!
echo buffer=!buffer!
if !count! leq !length! goto Loop

echo "%buffer%"
exit /b
:endRandomStr
echo "%buffer%"
exit /b
endlocal
