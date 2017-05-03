@echo off
echo version 1.0
setlocal enabledelayedexpansion
for %%p in (%*) do echo %%p
set first=%~nx1
echo first=%first%
set noext=%first:~0,-4%
echo noext=%noext%
set html_home=X:\html
set the_file=%2

::setlocal disabledelayedexpansion
echo "the_file=%the_file%"
echo noext=%noext%
call echo the_file=%%the_file%%
for /f "delims=" %%a in ('call echo "%%the_file%%"') do echo a=%%~a
for /f "delims=" %%a in ("!the_file!") do echo a=%%~a

