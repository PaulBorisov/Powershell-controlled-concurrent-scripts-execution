param(
  [string]$scriptPath
)
$started = start-process "powershell.exe" -ArgumentList $($scriptPath + " -keepopen") -PassThru -wait
