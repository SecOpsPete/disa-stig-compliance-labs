<#
.SYNOPSIS
    This PowerShell script configures the system to prevent autorun commands by setting
    the correct registry key used by Group Policy to enforce "Do not execute any autorun commands."

.NOTES
    Author          : Peter Van Rossum
    LinkedIn        : https://www.linkedin.com/in/vanr
    GitHub          : https://github.com/SecOpsPete
    Date Created    : 2025-07-01
    Last Modified   : 2025-07-01
    Version         : 1.2
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000185

.TESTED ON
    Date(s) Tested  : 2025-07-01
    Tested By       : Peter Van Rossum
    Systems Tested  : Windows 10
    PowerShell Ver. : Windows PowerShell 5.1 (ISE)

.USAGE
    Run this script in an elevated PowerShell session (Run as Administrator).

    Example:
    PS C:\> .\WN10-CC-000185.ps1

    Ensure script execution is allowed for the session:
    PS C:\> Set-ExecutionPolicy RemoteSigned -Scope Process
#>

# Correct path that reflects in GPEdit for AutoRun default behavior
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
$valueName = "NoAutorun"
$valueData = 1  # 1 = "Do not execute any autorun commands"

if (-not (Test-Path $registryPath)) {
    Write-Host "Registry path does not exist. Creating: $registryPath"
    New-Item -Path $registryPath -Force | Out-Null
}

Write-Host "Setting '$valueName' to '$valueData' at: $registryPath"
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

Write-Host "STIG WN10-CC-000185 remediation applied successfully. This setting is now reflected in GPEdit."
