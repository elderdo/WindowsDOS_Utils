@echo on
setlocal

set myfile=test.csv
FOR /F "eol=; tokens=1-4 delims=," %%i in (%myfile%) do (
  if defined exit (
    goto:end_loop
  ) else (
    call :process %%i %%j %%k %%l
  )
)
:end_loop

@echo for done
goto:eof

:process
echo %1 %2 %3 %4 "Step in fail1"
pause
if "%1"=="end" set exit=1

:eof
endlocal
