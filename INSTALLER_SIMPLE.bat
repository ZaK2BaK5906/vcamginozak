@echo off
chcp 65001 >nul
color 0B
title Multi-Caméras RTSP - Sans Environnement Virtuel

echo ╔════════════════════════════════════════════════════════════╗
echo ║      Multi-Caméras RTSP - Installation Globale             ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

echo [1/2] Vérification de Python...
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python n'est pas installé!
    pause
    exit /b 1
)
echo ✅ Python détecté

echo.
echo [2/2] Installation des dépendances (globalement)...
pip install Flask opencv-python numpy Werkzeug

if errorlevel 1 (
    echo ❌ Erreur lors de l'installation
    pause
    exit /b 1
)

echo.
echo ✅ Installation terminée!
echo.
pause
