For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c_%%a_%%b)
echo %mydate%
For /f "tokens=1-2 delims=/:" %%a in ("%TIME%") do (set mytime=%%a_%%b)

echo %mytime%
