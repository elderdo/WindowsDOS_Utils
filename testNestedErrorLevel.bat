set result=N
echo "stuff" > %TEMP%\stuff.txt
findstr "junk" %TEMP%\stuff.txt
if not %ERRORLEVEL%==0 (
	@echo result=%result%
	call :repeatFind
	call if %%ERRORLEVEL%%==0 (
		echo found stuff
		set result=Y
	)
)
@echo result=%result%

:repeatFind
findstr "stuff" %TEMP%\stuff.txt
goto:eof
