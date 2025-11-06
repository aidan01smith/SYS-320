function ApacheLogs1(){

$logsNotFormated = Get-Content C:\xampp\apache\logs\access.log
$tableRecords = @()

for ($i=0; $i -lt $logsNotFormated.Count; $i++){

# Split a string into a word

$words = $logsNotFormated[$i].Split(" ")

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
return $tableRecords | Where-Object {$_.IP -ilike "10.*"}
}
$tableRecords = ApacheLogs1
return $tableRecords | Format-Table -AutoSize -Wrap