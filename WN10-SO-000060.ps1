<#
.SYNOPSIS
    This PowerShell script enforces the requirement to prompt for a password when the system wakes from sleep (plugged in),
    in compliance with STIG ID WN10-SO-000060.

.NOTES
    Author          : Peter Van Rossum
    LinkedIn        : https://www.linkedin.com/in/vanr
    GitHub          : https://github.com/SecOpsPete
    Date Created    : 2025-07-01
    Last Modified   : 2025-07-01
    Version         : 1.0
    STIG-ID         : WN10-SO-000060

.TESTED ON
    Date(s) Tested  : 2025-07-01
    Systems Tested  : Windows 10 (x64)
    PowerShell Ver. : 5.1

.USAGE
    Run in an elevated PowerShell session.

    Example:
    PS C:\> .\WN10-SO-000060.ps1
#>

# Registry path for requiring password on wake (plugged in)
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51"
$valueName = "ACSettingIndex"
$valueData = 1  # 0x00000001 = Enabled

# Ensure registry path exists
if (-not (Test-Path $regPath)) {
    Write-Host "Creating registry path: $regPath"
    New-Item -Path $regPath -Force | Out-Null
} else {
    Write-Host "Registry path exists: $regPath"
}

# Set the value
Write-Host "Applying STIG WN10-SO-000060 - Requiring password on wake (plugged in)"
Set-ItemProperty -Path $regPath -Name $valueName -Value $valueData -Type DWord

Write-Host "Remediation complete. You may run 'gpupdate /force' or reboot to apply."
