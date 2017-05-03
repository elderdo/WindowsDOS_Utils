setlocal
REM Create the date and time elements.
for /f "tokens=1-7 delims=:/-, " %%i in ('echo exit^|cmd /q /k"prompt $d $t"') do (
   @echo ii=%%i j=%%j k=%%k l=%%l m=%%m n=%%n o=%%o
   for /f "tokens=2-4 delims=/-,() skip=1" %%a in ('echo.^|date') do (
      @echo a=%%a b=%%b c=%%c
      set dow=%%i
      set %%a=%%j
      set %%b=%%k
      set %%c=%%l
      set hh=%%m
      set min=%%n
      set ss=%%o
   )
)
@echo %yy%_%mm%_%dd%_%hh%_%min%_%ss%
mkdir %yy%_%mm%_%dd%
set ENV=AMDD
mkdir %yy%_%mm%_%dd%\%ENV%
endlocal
