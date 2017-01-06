set WshShell=createobject("wscript.shell")
WScript.Sleep 1000
WshShell.run "sndvol"
WshShell.AppActivate "Volume Control"
WScript.Sleep 1000
WshShell.SendKeys("{TAB}")
WScript.Sleep 1000
WshShell.SendKeys(" ")
WshShell.sendkeys "%{f4}"