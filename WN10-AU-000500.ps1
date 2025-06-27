<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Peter Van Rossum
    LinkedIn        : linkedin.com/vanr
    GitHub          : github.com/SecOpsPete
    Date Created    : 2025-06-27
    Last Modified   : 2025-06-27
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 2025-06-27
    Tested By       : Peter Van Rossum
    Systems Tested  : Win 10
    PowerShell Ver. : Windows PowerShell ISE

.USAGE
    To run this script, open PowerShell **as Administrator** and execute the file:

        .\Set-ApplicationLogMaxSize.ps1

    This script will:
    - Create the registry path if it does not exist.
    - Set the 'MaxSize' value for the Application Event Log to 32768 KB (32 MB).
    - Output status messages to confirm changes.

    This script is intended for manual or automated compliance enforcement based on
    DISA STIG ID WN10-AU-000500. Ensure execution policy allows script execution:

        Set-ExecutionPolicy RemoteSigned -Scope Process
   
#>

# Define the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$valueName    = "MaxSize"
$valueData    = 32768  # 0x00008000 in hexadecimal

# Check if the registry path exists, if not create it
if (-not (Test-Path $registryPath)) {
    Write-Host "Registry path does not exist. Creating: $registryPath"
    New-Item -Path $registryPath -Force | Out-Null
} else {
    Write-Host "Registry path already exists: $registryPath"
}

# Set the MaxSize value
Write-Host "Setting registry value '$valueName' to '$valueData' at: $registryPath"
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

# Output success message
Write-Host "Registry value '$valueName' successfully set to '$valueData'."
