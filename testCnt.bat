@echo off
set test=          dd                  dd         
call :CountWordsFromPhrase %test%
echo The number of words is: %_result%

set testfile=.\stuff.txt
call :CountWordsFromFile %testfile%
echo The number of words in file is: %_result%

call :PressAKey Press a key to exit..
cls & exit

:PressAKey
    echo %* & pause>nul
goto :eof

:CountWordsFromPhrase
SetLocal EnableDelayedExpansion
    set /a Count=0
    :repeatme
        if NOT "%1"=="" (
            set /a Count+=1
            shift
            goto :repeatme
        )
EndLocal & set _result=%Count%
goto :eof

:CountWordsFromFile
SetLocal EnableDelayedExpansion
    set file=%*
    set /a Count=0
    for /f "delims=" %%a in (%file%) do (
        call :CountWordsFromPhrase %%a
        set /a Count+=!_result!
    )
EndLocal & set _result=%Count%
goto :eof

