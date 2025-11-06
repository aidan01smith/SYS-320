function ApacheLogs1(){

$logsNotFormated = Get-Content C:\xampp\apache\logs\access.log | Select-Object -Last 10
$tableRecords = @()

foreach($logEntry in $logsNotFormated){

# Split a string into a word

    $words = $logEntry.Split(" ")

    $tableRecords += [pscustomobject]@{"IP" = $words[0];
                                   "Time" = $words[3].Trim('[');
                                   "Method" = $words[5].Trim('"');
                                   "Page" = $words[6];
                                   "Protocol" = $words[5];
                                   "Response" = $words[8];
                                   "Referrer" = $words[10];
                                   "Client" =  $words[7];
                                    }
    }

$tableRecords | Where-Object {$_.IP -ilike "10.*"} | Format-Table -AutoSize -Wrap
}
