@echo off
SETLOCAL DISABLEDELAYEDEXPANSION
echo.DELAYEDEXPANSION are now DISABLED
set v1=bogus
set v2=bogus
for /l %%a in (1,1,4) do (
    set v1=%%a
    set v2=%%a
    echo.a=%%a, v1=%v1%, v2=!v2!
)
echo Percent     sign 1: '%%'
echo Exclamation sign 1: '!'
echo Exclamation sign 2: '^!'
echo.
 
SETLOCAL ENABLEDELAYEDEXPANSION
echo.DELAYEDEXPANSION are now ENABLED
set v1=bogus
set v2=bogus
for /l %%a in (1,1,4) do (
    set v1=%%a
    set v2=%%a
    echo.a=%%a, v1=%v1%, v2=!v2!
)
echo Percent     sign 1: '%%'
echo Exclamation sign 2: '^^!'
 
ECHO.&PAUSE&GOTO:EOF
Test Code Output
	
DELAYEDEXPANSION are now DISABLED
a=1, v1=bogus, v2=!v2!
a=2, v1=bogus, v2=!v2!
a=3, v1=bogus, v2=!v2!
a=4, v1=bogus, v2=!v2!
Percent     sign 1: '%'
Exclamation sign 1: '!'
Exclamation sign 2: '!'
 
DELAYEDEXPANSION are now ENABLED
a=1, v1=bogus, v2=1
a=2, v1=bogus, v2=2
a=3, v1=bogus, v2=3
a=4, v1=bogus, v2=4
Percent     sign 1: '%'
Exclamation sign 2: '!'
 
Press any key to continue . . .
