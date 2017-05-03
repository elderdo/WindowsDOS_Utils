@for /f "tokens=2-8 delims=/:. " %%A in ("%date%:%time: =0%") do @set "UNIQUE=%%C%%A%%B%%D%%E%%F%%G"
@echo.%UNIQUE%
@echo.%date% %time%
@echo.%date% %time: =0%

