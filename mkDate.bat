@echo on
set dt=%date:~4%
set yy=%dt:~6%
set mm=%dt:~0,2%
set dd=%dt:~3,2%
@echo yy=%yy%

For /F "tokens=2-4 delims=:" %%a in ('Command /C Echo. ^| Time ^| Find "current"') Do Set THETIME=%%a%%b%%c
Set THETIME=%THETIME:~1%
@echo %1 %~n1%THEDATE%%THETIME%%~x1

