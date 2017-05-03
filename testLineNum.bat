@echo off
for /f "tokens=*" %%a in ('findstr /n .* "test.csv"') do (
  set "FullLine=%%a"
  for /f "tokens=1* delims=:" %%b in ("%%a") do (
    setlocal enabledelayedexpansion
    set "LineData=!FullLine:*:=!"
    if "%%b" equ "%1" echo(!LineData!
    endlocal
  )
)

