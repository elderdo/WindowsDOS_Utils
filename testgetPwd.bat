@echo off
echo "enter password"
FOR /F "tokens=1,2 delims=	" %%A IN ('getpwd') DO (
    SET Password=%%A
)
ECHO The password is %Password%

