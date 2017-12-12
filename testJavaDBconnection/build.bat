:: build.bat
:: Author: Douglas S. Elder
:: Date: 7/17/17
:: Desc: Compile DBConnection.java
:: and TestDBConnection.java.
:: Uponon successful compilation, put them in
:: TestDBConnection.jar
@echo off

call :getJavaHome
if "%JAVA_HOME%"=="" goto:eof

javac -cp ojdbc14.jar;TestDBConnection.jar DBConnection.java
if "%ERRORLEVEL%"=="0" jar uf TestDBConnection.jar DBConnection.class

javac -cp ojdbc14.jar;TestDBConnection.jar TestDBConnection.java
if "%ERRORLEVEL%"=="0" jar uf TestDBConnection.jar TestDBConnection.class && echo build successful

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


:done
endlocal


