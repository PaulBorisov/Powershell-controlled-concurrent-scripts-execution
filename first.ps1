write-host "The first 5 seconds script has been started..." -NoNewLine -ForegroundColor Yellow
Start-Sleep -s 5
write-host "and ended." -ForegroundColor Yellow

$PSScriptRoot = (Split-Path -Parent -Path $MyInvocation.MyCommand.Definition)
& "$PSScriptRoot\z_pause.ps1"