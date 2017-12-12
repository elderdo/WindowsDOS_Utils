:: vim:ts=2:sw=2:expandtab:smartindent:autoindent:
:: testDBConnection.bat
:: Author: Douglas S. Elder
:: Date: 7/17/17
:: Desc: Execute Java app TestDBConnection
:: to test an Oracle connection string,
:: userid, and password
:: Usage: testDBConnection.bat
:: This will look for a file DBConnection.properties
:: containing the following 3 properties:
::
:: ConnectionString=jdbc:oracle:thin:@ldap://oidlbr.cs.boeing.com:3097/amdkc46d,cn=oraclecontext,dc=boeingdb
:: UID=OracleUserId
:: PWD=passwordForOracleUserId
:: or
:: testDBConnection.bat connection_string uid pwd
:: where connection_string is the jdbc coonection string
:: uid is the Oracle user id
:: pwd is the password for Oracle user id

@echo off
setlocal enableextensions disabledelayedexpansion

set CONN_STR=
set UID=
set PWD=
set JAVA_HOME=

if NOT "%1"=="" set CONN_STR=%1
if NOT "%2"=="" set UID=%2
if NOT "%3"=="" set PWD=%3

call :getJavaHome
if "%JAVA_HOME%"=="" pause & goto:eof
::call :setup32_bit_env

:: ojdbc6.jar is required for the Oracle interface
:: TestDBConnection.jar contains the test app TestDBConnection
:: which tries to connect to Oracle using a connection string, user id,
:: and password
set CLASSPATH=ojdbc6.jar;TestDBConnection.jar;.
echo "%JAVA_HOME%\bin\java" TestDBConnection %CONN_STR% %UID% %PWD%
"%JAVA_HOME%\bin\java" -version -verbose
"%JAVA_HOME%\bin\java" TestDBConnection %CONN_STR% %UID% %PWD%
pause
goto:eof

:: find the Java Home directory
:getJavaHome
@echo off 

    rem Where to find java information in registry
    set "javaKey=HKLM\SOFTWARE\JavaSoft\Java Runtime Environment"

    rem Get current java version
    set "javaVersion="
    for /f "tokens=3" %%v in ('reg query "%javaKey%" /v "CurrentVersion" 2^>nul') do set "javaVersion=%%v"

    rem Test if a java version has been found
    if not defined javaVersion (
        echo Java version not found
        goto endProcess
    )

    rem Get java home for current java version
    set "javaDir="
    for /f "tokens=2,*" %%d in ('reg query "%javaKey%\%javaVersion%" /v "JavaHome" 2^>nul') do set "javaDir=%%e"

    if not defined javaDir (
        echo Java directory not found
    ) else (
        set JAVA_HOME=%javaDir%
    )

:setup32_bit_env
call getOra32Home.bat 32
if %ERRORLEVEL% neq 0 (
  @echo unable to get Oracle 32 bit env
  exit 4
)
@echo.ORACLE_HOME=%ORACLE_HOME%
for %%i in (%ORACLE_HOME%) do set ORAHOME_SHORT_NAME=%%~si
IF NOT EXIST %ORAHOME_SHORT_NAME%\NUL GOTO noOraHomeDIR
set PATH=%ORAHOME_SHORT_NAME%\bin;%PATH%
IF NOT EXIST %ORAHOME_SHORT_NAME%\bin\NUL GOTO noOraBinDIR
set TNS_ADMIN=%ORAHOME_SHORT_NAME%\network\admin
echo TNS_ADMIN=%TNS_ADMIN%
IF NOT EXIST %TNS_ADMIN%\NUL GOTO noOraTnsDIR


:missingConnStr
call :usage
goto:eof

:missingUid
call :usage
goto:eof

:missingPwd
call :usage
goto:eof

:usage
@echo testDBConnection.bat jdbc_connection_string OracleUserId OraclePassword"
goto:eof
:endProcess 
endlocal
