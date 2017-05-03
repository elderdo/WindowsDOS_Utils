for /f "usebackq delims=" %%A in (path.txt) do (
  echo %%A
)
