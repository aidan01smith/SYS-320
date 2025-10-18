# $scraped_links = Invoke-WebRequest -TimeoutSec 5 
# $scraped_links.Links

function Get-IOC {
    param([string]$URL = "http://10.0.17.47/IOC.html")

    # call the webpage
    $page = Invoke-WebRequest -TimeoutSec 10 $URL

    # get all of the table rows since the webpage is using a table
    $trs = $page.ParsedHtml.body.getElementsByTagName("tr")

    #create the array to store all of the IOCs
    $IOCs = @()


    #loop through all of the rows and skip the header at idnex 0 of the array
    for($i =1; $i -lt $trs.length; $i++) {

        # getting all of the table data cells in a row
        $tds = $trs[$i].getElementsByTagName("td")
    
    
        $IOC = [PSCustomObject]@{
            "Pattern" = $tds[0].innerText
            "Explanation" = $tds[1].innerText
        }
    
    #add it to the array
    $IOCs += $IOC

    }

    return $IOCs
}

Get-IOC | Format-Table -AutoSize