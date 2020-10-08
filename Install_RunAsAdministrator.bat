SET ThisScriptsDirectory=%~dp0
SET PowerShellScriptPath=%ThisScriptsDirectory%main.ps1
powershell.exe -noprofile -executionpolicy Bypass -file "%PowerShellScriptPath%" -Verb RunAs /user:Administrator
