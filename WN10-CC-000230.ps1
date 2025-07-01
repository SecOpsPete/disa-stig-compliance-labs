<#
.SYNOPSIS
    This PowerShell script enforces the Group Policy setting to prevent users from bypassing
    Windows Defender SmartScreen warnings in Microsoft Edge, in accordance with STIG ID WN10-CC-000230.

.NOTES
    Author          : Peter Van Rossum
    LinkedIn        : https://www.linkedin.com/in/vanr
    GitHub          : https://github.com/SecOpsPete
    Date Created    : 2025-07-01
    Last Modified   : 2025-07-01
    Version         : 1.1
    STIG-ID         : WN10-CC-000230

.TESTED ON
    Date(s) Tested  : 2025-07-01
    Tested By       : Peter Van Rossum
    Systems Tested  : Windows 10 (Local Group Policy)
    PowerShell Ver. : Windows PowerShell 5.1 (ISE)

.USAGE
    Run this script in an elevated PowerShell session.

    Example:
    PS C:\> .\WN10-CC-000230.ps1

    Ensure execution policy permits running scripts:
    PS C:\> Set-ExecutionPolicy RemoteSigned -Scope Process
#>

# Define registry path and key/value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Edge"
$valueName    = "PreventSmartScreenPromptOverride"
$valueData    = 1  # Enabled = Do not allow override of SmartScreen filter warnings

# Create registry path if missing
if (-not (Test-Path $registryPath)) {
    Write-Host "Creating registry path: $registryPath"
    New-Item -Path $registryPath -Force | Out-Null
} else {
    Write-Host "Registry path already exists: $registryPath"
}

# Apply the policy setting
Write-Host "Applying STIG WN10-CC-000230 - Prevent SmartScreen override"
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

Write-Host "STIG WN10-CC-000230 applied successfully. A reboot or gpupdate /force may be required."
