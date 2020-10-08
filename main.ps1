function CreateShareFolder {
    New-Item -Path "C:\Remote Assistant" -ItemType Directory -ErrorAction SilentlyContinue;
    if (Test-Path -Path "C:\Remote Assistant"){
        New-Item -Path "C:\Remote Assistant\RDPAssistance" -ItemType Directory -Verbose -ErrorAction SilentlyContinue;
        New-Item -Path "C:\Remote Assistant\Source" -ItemType Directory -Verbose -ErrorAction SilentlyContinue;
        New-Item -Path "C:\Remote Assistant\Remote Assistant" -ItemType Directory -Verbose -ErrorAction SilentlyContinue;
        New-SmbShare -Name RDPAssistance$ -Path "C:\Remote Assistant\RDPAssistance" -FullAccess "Everyone" -ErrorAction SilentlyContinue;
        New-SmbShare -Name Remoteassistant -Path "C:\Remote Assistant\Remote Assistant" -ReadAccess "Everyone" -ErrorAction SilentlyContinue;
        New-SmbShare -Name source$ -Path "C:\Remote Assistant\Source" -ReadAccess "Everyone" -ErrorAction SilentlyContinue;
    }
}

function CreateBatfile{
    New-Item -Path "C:\Remote Assistant\Remote Assistant\RemoteAssistant.bat" -ItemType "file" -Force;
    $line1 = "\\$env:COMPUTERNAME\Source$\RemoteAssistant.ps1"
    Add-Content -Path "C:\Remote Assistant\Remote Assistant\RemoteAssistant.bat" -Value "SET PowerShellScriptPath=$line1";
    Add-Content -Path "C:\Remote Assistant\Remote Assistant\RemoteAssistant.bat" -Value 'powershell.exe -noprofile -executionpolicy Bypass -file "%PowerShellScriptPath%" -Verb RunAs /user:Administrator';
}

function CreatePSfile{
    $hostcomputer = $env:COMPUTERNAME;
    $line02 = '$rdpname = "${env:COMPUTERNAME}_${name}.msrcincident";'
    $line03 = 'if (Test-Path -Path \\'+"$hostcomputer"+'\rdpassistance$\$rdpname){Remove-Item -Path "\\'+"$hostcomputer"+'\rdpassistance$\$rdpname" -Force;}'
    $line04 = 'msra /saveasfile "\\'+"$hostcomputer"+'\rdpassistance$\$rdpname" "123456?a";'
    [string]$Remoteps1file = "C:\Remote Assistant\Source\RemoteAssistant.ps1"
    New-Item -Path $Remoteps1file -ItemType "file" -Force;
    Add-Content -Path $Remoteps1file -Value '$username = whoami.exe;$a = $username -split "\\";$name = $a[1];';
    Add-Content -Path $Remoteps1file -Value $line02;
    Add-Content -Path $Remoteps1file -Value $line03;
    Add-Content -Path $Remoteps1file -Value $line04;
    Get-Content -Path $Remoteps1file;
}

CreateShareFolder
CreateBatfile
CreatePSfile
Write-Host "Remote assistant is installed successfully!" -ForegroundColor Green;