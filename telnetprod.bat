@echo on
set SCRIPT_HOME=C:\Users\zf297a\Documents\DOS

for /f %%A in (%SCRIPT_HOME%\prod.txt) do (
	set %%A
)
telnet %HOST%
