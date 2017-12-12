' find.vbs
' vim:ts=2:sw=2:sts=2:expandtab:autoindent:smartindent:
' Author: Douglas S. Elder
' Date: 7/20/2017
' Desc: Take the name of a file
' from the command line and by
' default search the C drive for it.
' Optionally, you can pass it the
' starting drive or directory.
Option Explicit
' use the following to quickly syntax check
' the script.  Run it with a -n option
if WScript.Arguments.Count > 1 and Wscript.Arguments(0) = "-n" then
  WScript.Quit
end if

dim startDir:startDir = "c:\"
dim rc:rc = 4
dim cnt = 0

Dim oFSO, oDrive, sFileName

Set oFSO   = CreateObject("Scripting.FileSystemObject") 
sFileName  = "stuff.txt"

'For Each oDrive In oFSO.Drives 
'  If oDrive.DriveType = 2 Then Recurse oDrive.RootFolder
'Next 

Sub Usage()
    WScript.Echo "Usage: cscript /nologo find.vbs [-s start_dir] file_name"
    WScript.Echo "  where file_name is the basename of the file"
    WScript.Echo "  -s start_dir overrides the staring directory which"
    WScript.Echo "  is c:\"
    WScript.Echo "  If the file is found it will return the Path for"
    WScript.Echo "  the file. If it does not find the file it will"
    Wscript.Echo "  return a non-zero return code"
    WScript.Echo "or"
    WScript.Echo "cscript /nologo find.vbs -n"
    WScript.Echo "will syntax check the script"
End Sub

function findFile(oFolder)
  Wscript.StdOut.Write "."
  cnt = cnt + 1
  if (cnt mod 80) = 0 then
  fi
  Dim oSubFolder, oFile
  on error resume next
  For Each oSubFolder In oFolder.SubFolders
   'Wscript.Echo oFolder.Name
   If IsAccessible(oFolder) Then
     findFile oSubFolder
   end if
  Next 

  For Each oFile In oFolder.Files
    If oFile.Name = sFileName Then
      Wscript.Echo oFolder.Path
      rc = 0
    End If
  Next 
End Function

Function IsAccessible(oFolder)
  On Error Resume Next
  IsAccessible = oFolder.SubFolders.Count >= 0
End Function

Select Case WScript.Arguments.Count
    Case 1: sFileName = WScript.Arguments(0)
    Case 3: if WScript.Arguments(0) = "-s" then
              startDir = WScript.Arguments(1) 
              sFileName = WScript.Arguments(2)
            end if
    Case Else: Usage
               WScript.Quit(4)
End Select

WScript.StdOut.Write "searching for " & sfilename
findFile(oFSO.GetFolder(startDir))
WScript.Quit(rc)

