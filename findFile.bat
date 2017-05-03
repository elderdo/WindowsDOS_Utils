:: find_sqlplus.bat
:: Author: Douglas S. Elder
:: Date: 5/23/2012
:: Desc: find sqlplus.exe

for /f %%a in ('dir /ad /b ora*') do (
  for /f %%b in ('dir /b C:\%%a\sqlplus.exe') do @echo.%%b
)
