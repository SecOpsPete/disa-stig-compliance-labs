<#
.SYNOPSIS
    Configures the Windows SMB server to always digitally sign SMB communications by setting the 
    appropriate registry value, in compliance with STIG ID WN10-SO-000120.

.NOTES
    Author          : Peter Van Rossum
    LinkedIn        : https://www.linkedin.com/in/vanr
    GitHub          : https://github.com/SecOpsPete
    Date Created    : 2025-07-01
    Last Modified   : 2025-07-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000120

.TESTED ON
    Date(s) Tested  : 2025-07-01
    Tested By       : Peter Van Rossum
    Systems Tested  : Windows 10
    PowerShell Ver. : Windows PowerShell 5.1 (ISE)

.USAGE
    Run this script in an elevated PowerShell session (Run as Administrator).

    Example:
    PS C:\> .\WN10-SO-000120.ps1

    Allow script execution for the session:
    PS C:\> Set-ExecutionPolicy RemoteSigned -Scope Process
#>

# Define registry path and setting for SMB server signing
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters"
$valueName = "RequireSecuritySignature"
$valueData = 1  # 0x00000001 in hex (Enabled: Require signing)

# Ensure registry path exists
if (-not (Test-Path $registryPath)) {
    Write-Host "Registry path does not exist. Creating: $registryPath"
    New-Item -Path $registryPath -Force | Out-Null
} else {
    Write-Host "Registry path exists: $registryPath"
}

# Apply the registry setting
Write-Host "Setting '$valueName' to '$valueData' at: $registryPath"
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

Write-Host "STIG WN10-SO-000120 remediation applied successfully."
