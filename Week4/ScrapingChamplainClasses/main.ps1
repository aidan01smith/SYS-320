<#

. (Join-Path $PSScriptRoot ChamplainScrape.ps1)

$table = gatherClasses
$FullTable = daysTranslator $table



$ITSInstructors = $FullTable | Where-Object { ($_."Class Code" -ilike "SYS*") -or `
                                              ($_."Class Code" -ilike "NET*") -or ` 
                                              ($_."Class Code" -ilike "SEC*") -or `
                                              ($_."Class Code" -ilike "FOR*") -or `
                                              ($_."Class Code" -ilike "CSI*") -or `
                                              ($_."Class Code" -ilike "DAT*")} `
                                              | Select-Object "Instructor" `
                                              | Sort-Object "Instructor" -Unique


$FullTable | Where {$_.Instructor -in $ITSInstructors.Instructor}`
           | Group-Object "Instructor" | Select-Object Count, Name | Sort-Object Count -Descending
#>

. (Join-Path $PSScriptRoot ChamplainScrape.ps1)

$table = gatherClasses
$FullTable = daysTranslator $table

$SISInstructors = $FullTable | Where-Object { ($_."Class_Code" -ilike "SYS*") -or `
                                              ($_."Class_Code" -ilike "NET*") -or `
                                              ($_."Class_Code" -ilike "SEC*") -or `
                                              ($_."Class_Code" -ilike "FOR*") -or `
                                              ($_."Class_Code" -ilike "CSI*") -or `
                                              ($_."Class_Code" -ilike "DAT*") } `
                              | Select-Object "Instructor" `
                              | Sort-Object "Instructor" -Unique

$FullTable | Where-Object { $_.Instructor -in $SISInstructors.Instructor } `
           | Group-Object "Instructor" `
           | Select-Object Count, Name `
           | Sort-Object Count -Descending
