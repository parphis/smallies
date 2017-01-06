Set wsc = WScript.CreateObject("WScript.Shell")
Set lnk = wsc.CreateShortcut(Replace(Wscript.Arguments.Named("linkpath"), "~", Chr(34)))

lnk.targetpath = WScript.Arguments.Named("target") 'Example: "C:\Program Files (x86)\lotus\notes\notes.exe"
lnk.arguments = Replace(WScript.Arguments.Named("params"), "~", Chr(34)) 'Example: "-sa " & """=U:\notes\notes.ini"""
lnk.description = Wscript.Arguments.Named("description") ' Example: "IBM Notes Client"
lnk.workingdirectory = Wscript.Arguments.Named("workingdir") ' Example "U:\notes\data"
lnk.save