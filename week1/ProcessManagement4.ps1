# script that runs instance of chrome and oppens champlain.edu
# or closes chrome if it is already open

$chromeProcess = Get-Process -Name "chrome" -ErrorAction SilentlyContinue

if ($chromeProcess) {
    Stop-Process -Name chrome -Force
    }
else {
    Start-Process chrome "https://www.champlain.edu"
}