Function gatherClasses(){
    $page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.49/Courses2025FA.html
    
    # all the tr elements of HTML document
    $trs = $page.ParsedHtml.body.getElementsByTagName("tr")
    
    # empty array 
    $fullTable = @()
    
    for($i=1; $i -lt $trs.length; $i++){ # every tr element
        $tds = $trs[$i].getElementsByTagName("td")
        # seperate start time and end time 
        $times = $tds[5].innerText.split("-")
        
        $fullTable += [pscustomobject]@{
            "Class_Code" = $tds[0].innerText;
            "Title" = $tds[1].innerText;
            "Days" = $tds[4].innerText;
            "Time_Start" = $times[0];
            "Time_End" = $times[1];
            "Instructor" = $tds[6].innerText;
            "Location" = $tds[9].innerText;
        }
    }
    return $fullTable
}


function daysTranslator($FullTable){
# Go over every record in the table
for($i=0; $i -lt $FullTable.length; $i++){
    #Empty array to hold days for every record
    $Days = @()

    # If you see "M" -> Monday
    if($FullTable[$i].Days -ilike "*M*"){$Days +="Monday"}
    # If you see "T" followed by T,W, or F -> Tuesday
    if($FullTable[$i].Days -ilike "*T[TWF]*"){$Days +="Tuesday"}
    # If you see "W" -> Wednesday
    if($FullTable[$i].Days -ilike "*W*"){$Days +="Wednesday"}
    # If you see "Th" -> Thursday
    if($FullTable[$i].Days -ilike "*Th*"){$Days +="Thursday"}
    # If you see "F" -> Friday
    if($FullTable[$i].Days -ilike "*F*"){$Days +="Friday"}
    # Make the Switch
    $FullTable[$i].Days = $Days
}
return $FullTable
}