. (Join-Path $PSScriptRoot Challenge1.ps1)
. (Join-Path $PSScriptRoot Challenge2.ps1)

# used chadbaldwin.net for reference on filtering logs

function Get-IOCMatches {

    param(
        [Parameter(Mandatory=$true)]
        [array]$Logs,

        [Parameter(Mandatory=$true)]
        [array]$IOCs
    )

    #establish a blank array to sort through
    $matches = @()

    foreach($log in $Logs) {
        foreach($ioc in $IOCs) {
            #recognize the pattern to match the html to the log file
            if($log.Page -like "*$($ioc.Pattern)*") {
                $matches += $log
                break
            }
        }
    }

    return $matches

}

#using the same trick as before to find the page and look through the logs to display the sus files
$iocs = Get-IOC -URL "http://10.0.17.47/IOC.html"
$logs = Get-ApacheLogs -LogPath "C:\Users\champuser\Documents\SYS-320\MidTerm\access.log"
$suspiciousLogs = Get-IOCMatches -Logs $logs -IOCs $iocs


$suspiciousLogs | Format-Table IP, Time, Method, Page, Protocol, Response, Referrer -AutoSize