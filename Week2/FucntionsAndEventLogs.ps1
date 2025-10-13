function Get-LoginLogOffTable {
param(
    [int]$Days
)


# get login and logoff records from windows events 
$loginouts = Get-EventLog System -Source Microsoft-Windows-Winlogon -After (Get-Date).AddDays(-$Days)

Write-Host "total events over the last 100 days: $($loginouts.Count)"

$loginoutsTable = @()
for($i=0; $i -lt $loginouts.Count; $i++){

    $event = ""
    if($loginouts[$i].InstanceID -eq 7001) {$event="Logon"}
    if($loginouts[$i].InstanceID -eq 7002) {$event="Logoff"}


    $sid = New-Object System.Security.Principal.SecurityIdentifier($loginouts[$i].ReplacementStrings[1])
    $user = $sid.Translate([System.Security.Principal.NTAccount]).Value

    $loginoutsTable += [PSCustomObject]@{"Time" = $loginouts[$i].TimeGenerated; `
                                           "Id" = $loginouts[$i].InstanceID; `
                                        "Event" = $event; `
                                         "User" = $user;
                                         }
}

return $loginoutsTable

}

# Get-LoginLogOffTable -Days 100

Function Get-StartShutdownTable {
    param(
        [int]$Days
    )

    $events = Get-EventLog System -Source EventLog -After (Get-Date).AddDays(-$Days)

    $eventsTable =@()

    for($i=0; $i -lt $events.Count; $i++){

        $event = ""
        if($events[$i].EventID -eq 6005) {$event="startup"}
        if($events[$i].EventID -eq 6006) {$event = "shutdown"}


        $eventsTable += [PSCustomObject]@{"Time" = $events[$i].TimeGenerated; `
                                         "ID" = $events[$i].EventID; `
                                         "Event" = $event; `
                                         "User" = "System"
                                         }

    }

    return $eventsTable
}

# Get-StartShutdownTable -Days 100