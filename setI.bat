@echo off
setlocal enabledelayedexpansion
if not exist I:\ (
  net use I: "\\sw\c17data\data197"
  echo I drive setup
) else (
  echo I drive already setup
)
endlocal
