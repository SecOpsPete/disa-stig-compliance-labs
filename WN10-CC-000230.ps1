<#
.SYNOPSIS
    Configures the system to prevent users from bypassing Microsoft Defender SmartScreen warnings
    in Microsoft Edge, enforcing the registry value for STIG ID WN10-CC-000230.

.NOTES
    Author          : Peter Van Rossum
    LinkedIn        : https://www.linkedin.com/in/vanr
    GitHub          : https://github.com/SecOpsPete
    Date Created    : 2025-07-01
    Last Modified   : 2025-07-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000230

.TESTED ON
    Date(s) Tested  : 2025-07-01
    Tested By       : Peter Van Rossum
    Systems Tested  : Windows 10 (21H2)
    PowerShell Ver. : Windows PowerShell 5.1 (ISE)

.USAGE
    Run this script in an elevated PowerShell session (Run as Administrator).

    Example:
    PS C:\> .\WN10-CC-000230.ps1

    Ensure script execution is permitted:
    PS C:\> Set-ExecutionPolicy RemoteSigned -Scope Process
#>

# Define registry path and setting
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter"
$valueName = "PreventOverride"
$valueData = 1  # 0x00000001 = Prevent user bypass of SmartScreen warnings

# Ensure the registry path exists
if (-not (Test-Path $registryPath)) {
    Write-Host "Creating registry path: $registryPath"
    New-Item -Path $registryPath -Force | Out-Null
} else {
    Write-Host "Registry path exists: $registryPath"
}

# Set the value
Write-Host "Enforcing SmartScreen bypass prevention..."
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

Write-Host "STIG WN10-CC-000230 remediation applied successfully."
