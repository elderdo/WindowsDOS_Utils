findstr "Created element" C:\Users\zf297a\AppData\Local\Temp\Load2.sql_log.txt
if %ERRORLEVEL%==0 (
	@echo found string
) else (
	@echo didn't find string
)
