. ﻿(Join-Path "C:\Users\champuser\Documents\SYS-320\Week6\TurnToMenu" Event-Logs.ps1)
. (Join-Path "C:\Users\champuser\Documents\SYS-320\Week7" Email.ps1)
. (Join-Path "C:\Users\champuser\Documents\SYS-320\Week7" Scheduler.ps1)
. (Join-Path "C:\Users\champuser\Documents\SYS-320\Week7" Configuration.ps1)

# obtaining configuration
$configuration = readConfiguration


# obtaining at risk users
$Failed = atRiskUsers $configuration.Days

#sending at risk users email
sendAlertEmail ($Failed | Format-Table | Out-String)

#setting the script to be run daily
ChooseTimeToRun($configuration.ExecutionTime)