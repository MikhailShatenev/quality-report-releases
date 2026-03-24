# Bootstrap: скачать и установить Power Quality Report Microservice
# Запуск одной командой в PowerShell (от имени администратора):
#   powershell -ExecutionPolicy Bypass -c "iwr https://raw.githubusercontent.com/MikhailShatenev/PowerQualityMicroservice/main/Microservice/bootstrap.ps1 | iex"

$ErrorActionPreference = "Stop"

$REPO    = "MikhailShatenev/quality-report-releases"
$VERSION = "1.0.0"
$ZIP_URL = "https://github.com/$REPO/releases/latest/download/power-quality-report-$VERSION.zip"
$INSTALL_DIR = "C:\power-quality-report"
$ZIP_TMP = "$env:TEMP\power-quality-report.zip"

Write-Host "=== Power Quality Report — Установка ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "Скачивание дистрибутива..."
Invoke-WebRequest -Uri $ZIP_URL -OutFile $ZIP_TMP -UseBasicParsing

Write-Host "Распаковка в $INSTALL_DIR..."
if (Test-Path $INSTALL_DIR) { Remove-Item $INSTALL_DIR -Recurse -Force }
Expand-Archive -Path $ZIP_TMP -DestinationPath $INSTALL_DIR -Force
Remove-Item $ZIP_TMP -Force

Write-Host "Запуск установщика..."
Write-Host ""
& "$INSTALL_DIR\install-windows.ps1"
