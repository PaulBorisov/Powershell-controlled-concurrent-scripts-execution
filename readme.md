This is a generic solution for Windows Powershell useful for DevOps. It provides you with the option to run multiple concurrent Powershell scripts simultaneously in a controlled manner.
It registers start and detects termination of each started concurrent script in your set. It also waits for completion of all started concurrent scripts gracefully, 
and detects the moment of ultimate completion of all started concurrent scripts. Parameters allow you to control execution - hidden or interactive state - as well
as a completion behavior - close Window of each concurrent script on its termination or keep it open - after the moment of its completion has been detected.

Supported Windows Powershell version: 2.0, 3.0, 4.0, 5.0 or higher.
- How to check your Powershell version: use $PSVersionTable.PSVersion.Major

How to use this solution
------------------------
- Unpack the ZIP to some temporary location and run the script container.ps1.
- It should sequentially start 3 other sample scripts from the same package: first.ps1 (5s), second.ps1 (3s), third.ps1 (2s).
- Execution progress is displayed on the screen. After all the scripts have been executed the main script also finishes.

Parameters
----------
[string]$PSScriptRoot, string, used to provide seamless compatibility between various Powershell versions
  Default value: [string]$PSScriptRoot = (Split-Path -Parent -Path $MyInvocation.MyCommand.Definition)

[string[]]$scriptsToExecute, array of strings, strings inside define paths to all scripts in your package
  Default value: [string[]]$scriptsToExecute = @("$PSScriptRoot\first.ps1", "$PSScriptRoot\second.ps1", "$PSScriptRoot\third.ps1")

[bool]$interactive, boolean, used to control execution behavior of concurrent scripts. 
It supports two states. $true means execute interactively with visible Powershell window while $false implies hidden Powershell session.
  Default value: [bool]$interactive = $true

[bool]$keepOpen = $true, boolean, used to control execution termination behavior of concurrent scripts in turned on interactive mode. This parameter is ignored if $interactive = $false.
It supports two states. $true means close the Window of concurrent Powershell script on its termination. $false means keep the Window of a terminated concurrent Powershell script open.
  Default value: [bool]$keepOpen = $false
