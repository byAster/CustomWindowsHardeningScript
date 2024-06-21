# Define paths for backups
$timestamp = Get-Date -Format "yyyyMMdd_HH-mm-ss"
$backupDir = "C:\Backup_CWHS\bakcup_$timestamp"
$regBackupDir = "$backupDir\RegistryBackups"
$servicesBackupPath = "$backupDir\ServicesBackup.log"
$appBackupPath = "$backupDir\ApplicationsBackup.log"
$logPath = "$backupDir\activity.log"

# Before we roll out we must be admin for things to run
If (!([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
	Write-Host "Please run as administrator." -ForegroundColor Red
	Exit
}

Write-Host "`nStarting backup process.`n"

# Start of transcription for .log file
Start-Transcript -Path $logPath > $null

# Create backup directory if it doesn't exist
if (-Not (Test-Path $backupDir)) {
    New-Item -Path $backupDir -ItemType Directory > $null
}

# Create registry backup directory
if (-Not (Test-Path $regBackupDir)) {
    New-Item -Path $regBackupDir -ItemType Directory > $null
}

# Import and load RegistryPaths
. .\RegistryPaths.ps1
$registryPaths = Get-RegistryPaths
Write-Host "`nChecking registry keys..."

# Export each registry key
foreach ($key in $registryPaths) {
    $keyPath = $key -replace ':', ''
    $keyName = $keyPath -replace '[\\/*?"<>|]', '_'
    Write-Host "Exporting $keyPath ..."
	if (Test-Path "Registry::$keyPath") {
        REG EXPORT $keyPath  "$regBackupDir\$keyName.reg"
    } else {
		# If it does not find the registry key, it will add it to the .ps1 so that it can be deleted if you want to undo its future creation.
		$deleteFutureKey = "REG DELETE '$keyPath'"
		Add-Content -Path "$regBackupDir\Non_existing.ps1" -Value $deleteFutureKey -Force
        Write-Host "The registry key was not found, so it has been added to Non_existing.ps1"
    }
}

# Export the list of running services (in list nonNeededservices)
. .\NonNeededservices.ps1
$nonNeededservices = Get-NonNeededservices

# Get all services running
Write-Host "`nChecking running services..."
$runningServices = Get-Service | Where-Object { $_.Status -eq 'Running' }

# Filter services
$matchingServices = $runningServices | Where-Object { $nonNeededservices -contains $_.Name }

# Extract matching services
if ($matchingServices) {
    $matchingServices | Select-Object Name, DisplayName | Format-Table -AutoSize | Out-File -FilePath $servicesBackupPath
	Write-Host "The operation completed successfully."
} else {
    Write-Host "None of the services to be disabled are running."
	Write-Output "No services have been affected." | Out-File -FilePath $servicesBackupPath
}

# Export the list of installed applications (in list removableApps)
. .\RemovableApps.ps1
$removableApps = Get-RemovableApps

# Get all installed applications
Write-Host "`nChecking installed applications..."
$installedApplications = Get-WmiObject -Class Win32_Product | Select-Object Name, Version

# Filter applications
$matchingApplications = $installedApplications | Where-Object { $removableApps -contains $_.Name }

# Extract matching applications
if ($matchingApplications) {
    $matchingApplications | Select-Object Name, DisplayName | Format-Table -AutoSize | Out-File -FilePath $appBackupPath
	Write-Host "The operation completed successfully."
} else {
    Write-Host "No application considered as 'removable Apps' has been found installed."
	Write-Output "No applications will be uninstalled." | Out-File -FilePath $appBackupPath
}

# Confirm backups
Write-Host "`nBackup process completed`n" -ForegroundColor Green
Write-Host "Log: $logPath"
Write-Host "Registry keys: $regBackupDir"
Write-Host "Services: $servicesBackupPath"
Write-Host "Applications: $appBackupPath`n"

# End of transcription
Stop-Transcript > $null
