function sendAlertEmail($Body){

$From = "aidan.smith01@mymail.champlain.edu"
$To = "aidan.smith01@mymail.champlain.edu"
$Subject = "Sus"

$Password = "secret!!!" | ConvertTo-SecureString -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $From, $Password

Send-MailMessage -From $From -To $To -Subject $Subject -Body $Body -SmtpServer "smtp.gmail.com" `
-port 587 -UseSsl -Credential $Credential

}

sendAlertEmail "Body of emai"