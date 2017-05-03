@echo off
@echo.-- Split off the first date token, i.e. day of the week
for /f %%a in ("%date%") do set d=%%a
@echo.Date   : %date%
@echo.d      : %d%
@echo.
