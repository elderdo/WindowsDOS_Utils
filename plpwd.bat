@echo on
SET NUMCHAR=%1
if "%1"=="" SET NUMCHAR=14
perl -le "print map { (a..z,A..Z,0..9,'_','@','#')[rand 65] } 0..pop" %NUMCHAR%
