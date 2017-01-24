write-host "The third 2 seconds script has been started..." -NoNewLine -ForegroundColor Red
Start-Sleep -s 2
write-host "and ended." -ForegroundColor Red

$PSScriptRoot = (Split-Path -Parent -Path $MyInvocation.MyCommand.Definition)
& "$PSScriptRoot\z_pause.ps1"