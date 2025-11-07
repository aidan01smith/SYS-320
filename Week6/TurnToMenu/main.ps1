﻿. (Join-Path $PSScriptRoot Users.ps1)
. (Join-Path $PSScriptRoot Event-Logs.ps1)
. (Join-Path $PSScriptRoot chromeScript.ps1)
. (Join-Path $PSScriptRoot apacheLogs2.ps1)
. (Join-Path $PSScriptRoot String-Helper.ps1)


$Prompt = "choose one of the options below:`n"
$Prompt += "1 - show last 10 apache logs`n"
$Prompt += "2 - show last 10 failed login attempts for all users`n"
$Prompt += "3 - display at risk users`n"
$Prompt += "4 - start chrome and go to champlain.edu. Closes chrome if open already`n"
$Prompt += "5 - Exit`n"

$operation = $true

while($operation){
    Write-Host $Prompt | Out-String
    $choose = Read-Host 



    elseif($chose -eq 1){
        ApacheLogs1
    }
    
    elseif($choose -eq 2){
        
        $days = Read-Host "number of days back you would like to get failed logins "
        lastTenFailedLogins $days
        
    }
    
    elseif($choose -eq 3){

        $days = Read-Host -Prompt "number of days to go back "
        Write-Host "at risk users:"
        atRiskUsers $days
    }
    
    elseif($choose -eq 4){
        
        ChromeStart
    }

    elseif($choose -eq 5){
        
        Write-Host "later :)" | Out-String
        exit
        $operation = $false 
    }
    
    
    else{
        
        Write-Host "this is not an input"
    }
}