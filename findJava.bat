:: Find java's HOME directory
:: check for Java 1.6 first
@ECHO OFF &SETLOCAL 
FOR /F "tokens=2*" %%a IN ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft\Java Runtime Environment\1.6" /v JavaHome') DO set "JavaHome16=%%b"
ECHO %JavaHome16%

FOR /F "tokens=2*" %%a IN ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft\Java Runtime Environment\1.7" /v JavaHome') DO set "JavaHome17=%%b"
ECHO %JavaHome17%

FOR /F "tokens=2*" %%a IN ('REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft\Java Runtime Environment\1.8" /v JavaHome') DO set "JavaHome18=%%b"
ECHO %JavaHome16%
