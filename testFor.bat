@echo off
for /F "tokens=5-8 delims=:. " %%i in ('echo.^| time ^| find "current" ') do set ttrn=%%i%%j%%k%%l
ech9o %ttrn%
for /f "tokens=1-2 delims=/" %%a in ("./sched1_2.xls") do (
	echo a=%%a
	echo b=%%b
)
