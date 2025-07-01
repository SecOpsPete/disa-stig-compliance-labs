<#
.SYNOPSIS
    This PowerShell script enforces the Group Policy setting that disables AutoRun by setting the
    appropriate registry value to prevent execution of any autorun commands. This allows GPEdit to
    reflect the change as "Enabled", in compliance with STIG ID WN10-CC-000185.

.NOTES
    Author          : Peter Van Rossum
    LinkedIn        : https://www.linkedin.com/in/vanr
    GitHub          : https://github.com/SecOpsPete
    Date Created    : 2025-07-01
    Last Modified   : 2025-07-01
    Version         : 1.1
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

# Define the GPO-backed registry path and values
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer"
$valueName    = "NoAutorun"
$valueData    = 1  # 0x00000001 = "Enabled: Do not execute any autorun commands"

# Create the registry path if it doesn't exist
if (-not (Test-Path $registryPath)) {
    Write-Host "Registry path does not exist. Creating: $registryPath"
    New-Item -Path $registryPath -Force | Out-Null
} else {
    Write-Host "Registry path exists: $registryPath"
}

# Set the value for AutoRun behavior
Write-Host "Setting '$valueName' to '$valueData' at: $registryPath"
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

Write-Host "STIG WN10-CC-000185 remediation applied successfully (GPO-visible)."
