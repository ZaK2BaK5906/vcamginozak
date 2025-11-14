@echo off
chcp 65001 >nul
color 0A
title Installation Multi-Caméras RTSP

echo ╔════════════════════════════════════════════════════════════╗
echo ║      Installation Application Multi-Caméras RTSP          ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

echo [1/4] Vérification de Python...
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python n'est pas installé!
    echo 📥 Téléchargez Python depuis: https://www.python.org/downloads/
    echo ⚠️  Cochez "Add Python to PATH" lors de l'installation
    pause
    exit /b 1
)
echo ✅ Python détecté

echo.
echo [2/4] Création de l'environnement virtuel...
if exist venv (
    echo ⚠️  Environnement virtuel existant détecté
    choice /C YN /M "Voulez-vous le supprimer et le recréer"
    if errorlevel 2 goto skip_venv_creation
    if errorlevel 1 (
        echo 🗑️  Suppression de l'ancien environnement...
        rmdir /s /q venv
    )
)

python -m venv venv
if errorlevel 1 (
    echo ❌ Erreur lors de la création de l'environnement virtuel
    pause
    exit /b 1
)
echo ✅ Environnement virtuel créé

:skip_venv_creation

echo.
echo [3/4] Activation de l'environnement virtuel...
call venv\Scripts\activate.bat
if errorlevel 1 (
    echo ❌ Erreur lors de l'activation de l'environnement virtuel
    pause
    exit /b 1
)
echo ✅ Environnement activé

echo.
echo [4/4] Installation des dépendances...
echo 📦 Installation de Flask, OpenCV et autres packages...
python -m pip install --upgrade pip
pip install -r requirements.txt
if errorlevel 1 (
    echo ❌ Erreur lors de l'installation des dépendances
    pause
    exit /b 1
)
echo ✅ Toutes les dépendances sont installées

echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║              🎉 Installation Terminée! 🎉                  ║
echo ╠════════════════════════════════════════════════════════════╣
echo ║                                                            ║
echo ║  Pour lancer l'application:                                ║
echo ║  👉 Double-cliquez sur LANCER.bat                         ║
echo ║                                                            ║
echo ║  Ou exécutez manuellement:                                 ║
echo ║  1. venv\Scripts\activate                                  ║
echo ║  2. python app.py                                          ║
echo ║                                                            ║
echo ║  Puis accédez à: http://localhost:5000                     ║
echo ║                                                            ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

pause
