:: mySpecialFtp.bat
:: Author: Douglas S. Elder
:: Date: 10/08/2012
:: Desc: This script makes sure 32 bit Jave is found first
:: via the PATH variable
:: It then runs the 32 bit Internet Explorer
@echo off

setlocal enabledelayedexpansion
:: set default to Java 32 bit
set JAVA_HOME=C:\Program Files (x86)\java
set JAVA_BIN=%JAVA_HOME%\bin

:loop
if "%1"=="-s" goto setSystem32Java
if "%1"=="-d" goto setDebug

set PATH=%JAVA_BIN%;%PATH%

java -version

"C:\Program Files (x86)\Internet Explorer\iexplore.EXE" http://java.com/en/download/testjava.jsp
goto done

:setDebug
shift
@echo on
goto loop

:setSystem32Java
shift
set JAVA_BIN=C:\Windows\System32
goto loop

:done
endlocal
