param(
    [Parameter(Mandatory=$true)]
    [string]$InputFile,

    [Parameter(Mandatory=$true)]
    [string]$OutputFile
)

if (!(Test-Path $InputFile)) {
    throw "Файл не найден: $InputFile"
}

$key = Get-Random -Minimum 10 -Maximum 250

$content = Get-Content $InputFile -Raw -Encoding UTF8

$bytes = [System.Text.Encoding]::UTF8.GetBytes($content)

$encoded = foreach ($b in $bytes) {
    $b -bxor $key
}

$array = ($encoded -join ',')

$loader = @"
`$k = $key

`$d = [byte[]]@(
$array
)

`$s = -join (`$d | ForEach-Object {
    [char](`$_ -bxor `$k)
})

Invoke-Expression `$s
"@

Set-Content -Path $OutputFile -Value $loader -Encoding UTF8

Write-Host "Готово:"
Write-Host "Исходник: $InputFile"
Write-Host "Результат: $OutputFile"
Write-Host "Ключ: $key"