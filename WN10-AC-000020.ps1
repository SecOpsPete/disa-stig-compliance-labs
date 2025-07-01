<#
.SYNOPSIS
    This PowerShell script configures the system to enforce a password history of 24 remembered passwords,
    in compliance with STIG ID WN10-AC-000020.

.NOTES
    Author          : Peter Van Rossum
    LinkedIn        : https://www.linkedin.com/in/vanr
    GitHub          : https://github.com/SecOpsPete
    Date Created    : 2025-07-01
    Last Modified   : 2025-07-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000020

.TESTED ON
    Date(s) Tested  : 2025-07-01
    Tested By       : Peter Van Rossum
    Systems Tested  : Windows 10
    PowerShell Ver. : Windows PowerShell 5.1 (ISE)

.USAGE
    Run this script in an elevated PowerShell session (Run as Administrator).

    Example:
    PS C:\> .\WN10-AC-000020.ps1

    Ensure script execution is allowed for the session:
    PS C:\> Set-ExecutionPolicy RemoteSigned -Scope Process
#>

# Set password history to 24 passwords remembered
$passwordHistory = 24

Write-Host "Setting password history to $passwordHistory passwords remembered..."

# Apply the setting using net accounts
try {
    cmd /c "net accounts /uniquepw:$passwordHistory" | Out-Null
    Write-Host "STIG WN10-AC-000020 remediation applied successfully."
} catch {
    Write-Error "Failed to set password history: $_"
}
