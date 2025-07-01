<#
.SYNOPSIS
    This PowerShell script renames the built-in Guest account to "NewGuest" in compliance with Windows STIG requirements.

.NOTES
    Author          : Peter Van Rossum
    LinkedIn        : linkedin.com/vanr
    GitHub          : github.com/SecOpsPete
    Date Created    : 2025-07-01
    Last Modified   : 2025-07-01
    Version         : 1.1
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000025

.TESTED ON
    Date(s) Tested  : 2025-07-01
    Tested By       : Peter Van Rossum
    Systems Tested  : Windows 10 (PowerShell 5.1)
    PowerShell Ver. : Windows PowerShell 5.1 (ISE)

.USAGE
    Run this script in an elevated PowerShell session (Run as Administrator).

    Example:
    PS C:\> .\Rename-GuestAccount.ps1

    Ensure script execution is allowed for the session:
    PS C:\> Set-ExecutionPolicy RemoteSigned -Scope Process
#>

# Define the target SID suffix and desired new name
$targetSidSuffix = '-501'            # RID 501 identifies the built-in Guest account
$newGuestName    = 'NewGuest'        # Desired compliant name

# Query WMI for the local Guest account using the well-known RID
Write-Host "Searching for built-in Guest account with SID ending in $targetSidSuffix..."
$oldGuestName = (Get-WmiObject Win32_UserAccount | Where-Object {
    $_.SID -like "S-1-5-21-*-501"
}).Name

# If the Guest account exists and is not already renamed, proceed
if ($oldGuestName -and $oldGuestName -ne $newGuestName) {
    Write-Host "Found Guest account: $oldGuestName"
    Write-Host "Renaming '$oldGuestName' to '$newGuestName'..."

    # Perform rename using WMIC (compatible with PowerShell 5.1)
    $renameResult = cmd /c "wmic useraccount where name='$oldGuestName' rename '$newGuestName'" 2>&1

    # Basic success check
    if ($renameResult -match "ReturnValue = 0") {
        Write-Host "Guest account successfully renamed to '$newGuestName'."
    } else {
        Write-Warning "Rename attempt failed. Output:"
        Write-Output $renameResult
    }
}
elseif ($oldGuestName -eq $newGuestName) {
    Write-Host "Guest account is already renamed to '$newGuestName'. No changes made."
}
else {
    Write-Warning "No Guest account found with SID ending in $targetSidSuffix. It may have been removed or renamed previously."
}
