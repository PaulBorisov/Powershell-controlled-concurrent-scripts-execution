write-host "The second 3 seconds script has been started..." -NoNewLine -ForegroundColor Green
Start-Sleep -s 3
write-host "and ended." -ForegroundColor Green

$PSScriptRoot = (Split-Path -Parent -Path $MyInvocation.MyCommand.Definition)
& "$PSScriptRoot\z_pause.ps1"