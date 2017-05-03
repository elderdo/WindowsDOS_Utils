@echo on
setlocal enableDelayedExpansion
set txt="aa bb cc dd ee ff gg"
set txt=%txt:"=%
for   %%a in (%txt%) do (
  echo %%a 
)
endlocal
