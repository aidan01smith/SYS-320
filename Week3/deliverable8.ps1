$ipsoften = $ips | Where-Object { $_.IP -ilike  "10.*" }
$counts = $ipsoften | Group-Object IP
$counts | Select-Object Count, Name