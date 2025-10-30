<#
1. Write a function in a file called Apache-Logs.ps1 that will take 3 inputs:
A) The page visited or referred from (index.html, page1.html, ...)
B) HTTP code returned
C) Name of the web browser
Gives 1 output:
IP addresses that have visited the given page or referred from, with the given web browser, and got the given HTTP response

Use dot notation to call your function from a file called main.ps1
#>


function ApacheLogs{

    $webpage = $args[0]
    $code = $args[1]
    $browserName = $args[2]

    # display the 404 not found pages
    $notFounds = Get-Content C:\xampp\apache\logs\access.log | Select-String "$webpage" | Select-String "$code" | Select-String "$browserName"

    $regex = [regex] "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"

    $unorganized = $regex.Matches($notFounds)



    #get the ips
    $ips = @()

     for ($i=0; $i -lt $unorganized.Count; $i++){
        $ips += [pscustomobject]@{ "IP"  = $unorganized[$i].Value; }
    }

# Count $Ips
    $ipsoften = $ips | Where-Object { $_.IP -ilike  "10.*" }
    $counts = $ipsoften | Group-Object IP
    $counts | Select-Object Count, Name
}