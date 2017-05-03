@echo off
for %%a in ("%path:;=";"%") do @echo %%~a >> path.txt
gvim path.txt
