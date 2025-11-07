function readConfiguration(){
    $days = Get-Content $PSScriptRoot\configuration.txt -First 1
    $time = Get-Content $PSScriptRoot\configuration.txt -Last 1
    
    $readConfigTable = @()
    $readConfigTable = [pscustomobject]@{"Days" = $days; "Time" = $time} 

    return $readConfigTable
    
}

function changeConfiguration(){

    Write-Host "Enter the number of days for which the logs will be obtained" | Out-String
    $setDays = Read-Host

    Write-Host "Enter the daily execution time of the script:"
    $setExecution = Read-Host


    Clear-Content -Path $PSScriptRoot\configuration.txt
    $setDays | Out-File -FilePath $PSScriptRoot\configuration.txt
    $setExecution | Out-File -FilePath $PSScriptRoot\configuration.txt -Append
}




function configurationMenu(){
    $Prompt = "choose one of the below:`n"
    $Prompt += "1 - Show Configuration`n"
    $Prompt += "2 - Change Configuration`n"
    $Prompt += "3 - Exit`n"

    $operation = $True

    while ($operation) {

    Write-Host $Prompt | Out-String

    $choice = Read-Host

    if($choice -eq 1){
        Write-Host (readConfiguration | Format-Table | Out-String)
        }
    elseif ($choice -eq 2){
        changeConfiguration
        }
    elseif ($choice -eq 3){
        Write-Host "goodbye" | Out-String

        exit
        $operation = $False
        }
    else{
        Write-Host "this is not a choice for $choice" | Out-String
        }
    }
}

configurationMenu