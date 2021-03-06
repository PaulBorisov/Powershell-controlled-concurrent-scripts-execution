## -----------------------------------------------------------------------------------
## Version 3. A unified solution, which correctly works in Powershell 2.0 and higher.
## Use the paremeter $interactive = $true see execution of child scripts on the screen.
## Use the paremeter $keepOpen = $true to keep Windows of child scripts open after
## they have completed execution.It is ignored if the parameter $interactive = $false.
## -----------------------------------------------------------------------------------
param(
  [string]$PSScriptRoot = (Split-Path -Parent -Path $MyInvocation.MyCommand.Definition)
  ,[string[]]$scriptsToExecute = @("$PSScriptRoot\first.ps1", "$PSScriptRoot\second.ps1", "$PSScriptRoot\third.ps1")
  ,[bool]$interactive = $true
  ,[bool]$keepOpen = $false
)

####################################################### EXECUTION ##########################################################
$activeProcesses = @{}

write-host
$scriptsToExecute | % {
  if( $interactive ) {
    if( $keepOpen ) {
      $started = start-process "powershell.exe" -ArgumentList "$PSScriptRoot\z_stub.ps1 -scriptPath $_" -PassThru -WindowStyle Hidden
    } else {
      $started = start-process "powershell.exe" -ArgumentList $_ -PassThru
    }
  } else {
    $started = start-process "powershell.exe" -ArgumentList $_ -PassThru -WindowStyle Hidden
  }
  $name = $($_.Substring($_.LastIndexOf('\')+1))
  $activeProcesses[$name] = $started.Id
  write-host "Started: $_"
}

write-host
write-host "All $($scriptsToExecute.Length) scripts have been started."
write-host
$quit = $false
while( !$quit ) {
  $runningCount = 0
  $names = $null
  $activeProcesses.GetEnumerator() | % {
    $id = $_.Value
    $tmp = (get-process | ? {$_.Id -eq $id})
    $isActive = ($tmp -ne $null) -and ($tmp.Length -eq $null -or $tmp.Length -gt 0)
    if( $isActive ) {
      $runningCount += 1
      $names += $_.Name + ','
    }
  }
  if( $runningCount -eq 0 ) {
    $quit = $true
  } else {
    start-sleep -s 1
    write-host "$runningCount script(s) running: $($names.TrimEnd(','))"
  }
}

write-host
write-host "All $($scriptsToExecute.Length) scripts have been completed."
