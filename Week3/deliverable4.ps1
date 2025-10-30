# list out the 400 and 404 messages

Get-Content C:\xampp\apache\logs\access.log | Select-String ' 404 ',' 400 '