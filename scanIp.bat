@echo off
del ping.txt
for /l %%A in (0,1,255) do (
  ping -n 1 192.168.1.%%A > NUL
  set RC=%ERRORLEVEL%
  if "%RC%"=="0" (
	echo "found 192.168.1.%%A" >> ping.txt
  )
)

