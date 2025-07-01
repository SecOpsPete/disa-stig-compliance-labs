<#
.SYNOPSIS
    This PowerShell script ensures that a password is required when resuming from sleep while plugged in,
    in compliance with STIG ID WN10-CC-000150.

.NOTES
    Author          : Peter Van Rossum
    LinkedIn        : linkedin.com/vanr
    GitHub          : github.com/SecOpsPete
    Date Created    : 2025-07-01
    Last Modified   : 2025-07-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000150

.TESTED ON
    Date(s) Tested  : 2025-07-01
    Tested By       : Peter Van Rossum
    Systems Tested  : Windows 10
    PowerShell Ver. : Windows PowerShell 5.1 (ISE)

.USAGE
    Run this script in an elevated PowerShell session (Run as Administrator).

    Example:
    PS C:\> .\WN10-CC-000150.ps1

    Ensure script execution is allowed for the session:
    PS C:\> Set-ExecutionPolicy RemoteSigned -Scope Process
#>

# Define the registry path and values
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51"
$valueName    = "ACSettingIndex"
$valueData    = 1  # 0x00000001 in hexadecimal

# Check if the registry path exists, create if missing
if (-not (Test-Path $registryPath)) {
    Write-Host "Registry path does not exist. Creating: $registryPath"
    New-Item -Path $registryPath -Force | Out-Null
} else {
    Write-Host "Registry path already exists: $registryPath"
}

# Apply the value
Write-Host "Setting registry value '$valueName' to '$valueData' at: $registryPath"
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

# Output success
Write-Host "Registry value '$valueName' successfully set to '$valueData'."
