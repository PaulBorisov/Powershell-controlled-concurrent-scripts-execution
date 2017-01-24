This is a generic solution for Windows Powershell useful for DevOps. It provides you with the option of running multiple concurrent Powershell scripts simultaneously in a controlled manner.
The main script container.ps1 registers start and detects termination of each started concurrent script in a bucket - first.ps1, second.ps1, third.ps1 in the default configuration. It also waits for a completion of all started concurrent scripts gracefully, and detects the moment of ultimate completion of all concurrent scripts. Parameters grant you certain level of control over execution permitting hidden or interactive state mode as well as one of two completion behaviors: "close Window of each concurrent script on its termination" or "keep script's window open after the moment of its completion has been detected". The last option is useful for reviewing results of long running scripts after their completion.

Supported versions of Windows Powershell: 2.0, 3.0, 4.0, 5.0 or higher.
- How to check your Powershell version: use $PSVersionTable.PSVersion.Major

How to use this solution
------------------------
- Unpack the ZIP to some temporary location and run the script container.ps1.
- It should sequentially start 3 other sample scripts from the same package: first.ps1 (5s), second.ps1 (3s), third.ps1 (2s).
- Execution progress is displayed on the screen. After all the scripts have been executed the main script also stops.

Parameters
----------
[string]$PSScriptRoot, string, used to provide seamless compatibility between various Powershell versions
  Default value: [string]$PSScriptRoot = (Split-Path -Parent -Path $MyInvocation.MyCommand.Definition)

[string[]]$scriptsToExecute, array of strings, strings inside define paths to all scripts in your package
  Default value: [string[]]$scriptsToExecute = @("$PSScriptRoot\first.ps1", "$PSScriptRoot\second.ps1", "$PSScriptRoot\third.ps1")

[bool]$interactive, boolean, used to control execution behavior of concurrent scripts. 
It supports two states. $true means execute interactively with visible Powershell window while $false implies hidden Powershell session.
  Default value: [bool]$interactive = $true

[bool]$keepOpen, boolean, used to control execution termination behavior of concurrent scripts if the interactive mode is turned on. This parameter is ignored if $interactive = $false.
It supports two states. $true means close the window of concurrent Powershell script on its termination. $false means keep the window of a terminated concurrent Powershell script open after its completion.
  Default value: [bool]$keepOpen = $false
