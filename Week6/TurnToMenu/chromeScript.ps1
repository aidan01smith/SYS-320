function chromeStart(){

    $process = Get-Process -Name *chrome*

    if($process -eq $null){
        Start-Process "chrome" -ArgumentList "https://champlain.edu"
        Write-Host "starting chrome"

        }

    else{
        Stop-Process -Name *chrome*
        Write-Host "stopping chrome - it is already running"
    }
}

# chromeStart