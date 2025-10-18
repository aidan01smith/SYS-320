function Get-ApacheLogs {

    param([string]$LogPath = "C:\Users\champuser\Documents\SYS-320\MidTerm\access.log")

    $logContent = Get-Content $LogPath
    # make an array for parthing through the file
    $logs = @()

    foreach($line in $logContent) {
        # split the log up by the spaces and the brackets to get the desired output
        $ip = $line.Split(' ')[0]
        $splitTimePart = $line.Split('[')[1]
        $splitTime = $splitTimePart.Split(']')[0]

        # split everything up by the quotes
        $quotesSplit = $line.Split('"')
        $request = $quotesSplit[1]
        $referrer = $quotesSplit[3]

        # split request into parts 
        $reqParts = $request.Split(' ')
        $meth = $reqParts[0]
        $page = $reqParts[1]
        $protocol = $reqParts[2]

        # get response code between quotes to make it look like i want it to
        $response = $quotesSplit[2].Trim().Split(' ')[0]

        #create log object
        $logs += [pscustomobject]@{
            "IP"       = $ip
            "Time"     = $time
            "Method"   = $meth
            "Page"     = $page
            "Protocol" = $protocol
            "Response" = $response
            "Referrer" = $referrer
        }
    
    }

    return $logs
}

Get-ApacheLogs | Select-Object IP, Time, Method, Page, Protocol, Response, Referrer | Format-Table