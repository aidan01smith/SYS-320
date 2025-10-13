. (Join-Path $PSScriptRoot "FunctionsAndEventLogs.ps1")

clear

$loginoutsTable = Get-LoginLogOffTable -Days 100
$loginoutsTable

$shutdownsTable = Get-StartShutDownTable -Days 100 | Where-Object { $_.Event -eq "Shutdown" }
$shutdownsTable

$startupsTable = Get-StartShutdownTable -Days 100 | Where-Object { $_.Event -eq "Startup" }
$startupsTable