# Get-Content C:\xampp\apache\logs\access.log | Select-String ' 200 ' -NotMatch

# from every .log file in the directory, only get logs that contains the word error
# $A = Get-ChildItem C:\xampp\apache\logs\*.log | Select-String 'error'

# display the last five elements in the array
# $A[-5..-1]




$notfounds = Get-Content C:\xampp\apache\logs\access.log | Select-String ' 404 '

$regex = [regex] "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"

$ipsUnorganized = $regex.Matches($notfounds)

# Get ips as pscustomobject

$ips = @()

for ($i=0; $i -lt $ipsUnorganized.Count; $i++){
    $ips += [pscustomobject]@{ "IP"  = $ipsUnorganized[$i].Value; }
}


$ipsoften = $ips | Where-Object { $_.IP -ilike  "10.*" }
$counts = $ipsoften | Group-Object IP
$counts | Select-Object Count, Name