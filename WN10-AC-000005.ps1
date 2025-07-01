<#
.SYNOPSIS
    This PowerShell script sets the account lockout duration to 15 minutes
    in compliance with STIG ID WN10-AC-000005.

.NOTES
    Author          : Peter Van Rossum
    LinkedIn        : https://www.linkedin.com/in/vanr
    GitHub          : https://github.com/SecOpsPete
    Date Created    : 2025-07-01
    Last Modified   : 2025-07-01
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000005

.TESTED ON
    Date(s) Tested  : 2025-07-01
    Tested By       : Peter Van Rossum
    Systems Tested  : Windows 10
    PowerShell Ver. : Windows PowerShell 5.1 (ISE)

.USAGE
    Run this script in an elevated PowerShell session (Run as Administrator).

    Example:
    PS C:\> .\WN10-AC-000005.ps1

    Ensure script execution is allowed for the session:
    PS C:\> Set-ExecutionPolicy RemoteSigned -Scope Process
#>

# Set Account Lockout Duration to 15 minutes (or 0 if admin unlock is preferred)
$duration = 15

Write-Host "Setting Account Lockout Duration to $duration minute(s)..."

# Use 'net accounts' to apply the policy
try {
    cmd /c "net accounts /lockoutduration:$duration" | Out-Null
    Write-Host "STIG WN10-AC-000005 remediation applied successfully."
} catch {
    Write-Error "Failed to set lockout duration: $_"
}
