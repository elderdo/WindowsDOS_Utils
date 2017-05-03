@echo on
for /f %%A in (prod.txt) do (
	set %%A
)
echo PWD=%PWD%
echo UID=%UID%
echo HOST=%HOST%
