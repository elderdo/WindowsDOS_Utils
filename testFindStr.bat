findstr /m "identical" %TEMP%\diff.txt
if "%ERRORLEVEL%"=="0" (
	@echo identical
) else (
	@echo not identical
)
