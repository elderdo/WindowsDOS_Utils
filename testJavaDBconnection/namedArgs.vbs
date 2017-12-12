Dim NamedArgs, UnnamedArgs
Set NamedArgs = WScript.Arguments.Named
Set UnnamedArgs = WScript.Arguments.Unnamed

Dim N
For N = 0 To UnnamedArgs.Count - 1
  WScript.Echo "WshArguments.Unnamed.Item(" & CStr(N) & ") = " & UnnamedArgs.Item(N)
Next

Dim Arg
For Each Arg In NamedArgs
  WScript.Echo "WshArguments.NamedArgs.Item(" & Arg & ") = " & NamedArgs.Item(Arg)
Next
