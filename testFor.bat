@echo on
setlocal enabledelayedexpansion
set sftp=data.txt
if not "%1"=="" set sftp="%1"
echo 1
set PATH=C:\Windows\System32;%PATH%
for /F "tokens=5-8 delims=:. " %%i in ('echo.^| time ^| find "current" ') do set ttrn=%%i%%j%%k%%l
echo 2
echo %ttrn%
for /f "tokens=1-2 delims=/" %%a in ("./stuff2.txt") do (
	echo a=%%a
	echo b=%%b
)
echo 3
for  /f %%f in (stuff2.txt) do (
  @echo %sftp% %%f
)
