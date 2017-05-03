@echo off
set test=Well well.....
(
    set test=Hello!
    for /f "delims=" %%a in ('call echo "%%test%%"') do echo %%~a
    echo %test%
)

