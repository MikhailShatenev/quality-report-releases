#!/bin/bash
# Bootstrap: скачать и установить Power Quality Report Microservice
# Запуск одной командой:
#   curl -fsSL https://raw.githubusercontent.com/MikhailShatenev/PowerQualityMicroservice/main/Microservice/bootstrap.sh | sudo bash

set -e

REPO="MikhailShatenev/quality-report-releases"
VERSION="1.0.0"
ZIP_URL="https://github.com/$REPO/releases/latest/download/gauss-analytics-$VERSION.zip"
INSTALL_DIR="/opt/gauss-analytics"
ZIP_TMP="/tmp/gauss-analytics.zip"

echo "=== Power Quality Report — Установка ==="
echo ""
echo "Скачивание дистрибутива..."
curl -fsSL "$ZIP_URL" -o "$ZIP_TMP"

echo "Распаковка в $INSTALL_DIR..."
rm -rf "$INSTALL_DIR"
mkdir -p "$INSTALL_DIR"
unzip -q "$ZIP_TMP" -d "$INSTALL_DIR"
rm -f "$ZIP_TMP"

echo "Запуск установщика..."
echo ""
bash "$INSTALL_DIR/install-linux.sh"
