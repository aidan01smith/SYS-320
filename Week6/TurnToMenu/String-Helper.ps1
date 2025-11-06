<# String-Helper
*************************************************************
   This script contains functions that help with String/Match/Search
   operations. 
************************************************************* 
#>


<# ******************************************************
   Functions: Get Matching Lines
   Input:   1) Text with multiple lines  
            2) Keyword
   Output:  1) Array of lines that contain the keyword
********************************************************* #>
function getMatchingLines($contents, $lookline){

$allines = @()
$splitted =  $contents.split([Environment]::NewLine)

for($j=0; $j -lt $splitted.Count; $j++){  
 
   if($splitted[$j].Length -gt 0){  
        if($splitted[$j] -ilike $lookline){ $allines += $splitted[$j] }
   }

}

return $allines
}

# TODO: Create a function called checkPassword in String-Helper that:
#              - Checks if the given string is at least 6 characters
#              - Checks if the given string contains at least 1 special character, 1 number, and 1 letter
#              - If the given string does not satisfy conditions, returns false
#              - If the given string satisfy the conditions, returns true

function checkPassword($password) {

    $parametersMet = $True

    if($password -inotlike "*[`!`@`#`$`%`^`&`/`\`?`(`)`*`]*"){
        Write-Host "password does not contain a special character"
        $parametersMet = $False
    }

    if($password -inotlike "*[0123456789]*"){
        Write-Host "password does not contain a number"
        $parametersMet = $False
    }

    if($password -inotlike "*[qwertyuiopasdfghjklzxcvbnm]*"){

        Write-Host "password does not contain letter"

        $parametersMet = $False
    }
    
    if($password.Length -lt 6){
        Write-Host "password must be over six characters"
        $parametersMet = $False
    }

    return $parametersMet
}

# TODO: Check the given password with your new function. 
# - If false is returned, do not continue and inform the user
# - If true is returned, continue with the rest of the function


# $password = "hello12345!@"
# checkPassword $password