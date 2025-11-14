@echo off
chcp 65001 >nul
color 0B
title Multi-Caméras RTSP - Serveur Local

echo ╔════════════════════════════════════════════════════════════╗
echo ║         Application Multi-Caméras RTSP - Démarrage         ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

REM Vérifier si l'environnement virtuel existe
if not exist venv (
    echo ❌ Environnement virtuel non trouvé!
    echo 📦 Veuillez d'abord exécuter INSTALLER.bat
    echo.
    pause
    exit /b 1
)

echo [1/3] Activation de l'environnement virtuel...
call venv\Scripts\activate.bat
if errorlevel 1 (
    echo ❌ Erreur lors de l'activation
    pause
    exit /b 1
)
echo ✅ Environnement activé

echo.
echo [2/3] Vérification des dépendances...
venv\Scripts\python.exe -c "import flask, cv2" 2>nul
if errorlevel 1 (
    echo ❌ Dépendances manquantes!
    echo 📦 Installation des dépendances...
    venv\Scripts\python.exe -m pip install -r requirements.txt
)
echo ✅ Dépendances OK

echo.
echo [3/3] Démarrage du serveur...
echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║                  🚀 SERVEUR EN COURS 🚀                    ║
echo ╠════════════════════════════════════════════════════════════╣
echo ║                                                            ║
echo ║  🌐 Accédez à l'application dans votre navigateur:        ║
echo ║                                                            ║
echo ║     http://127.0.0.1:5000                                  ║
echo ║                                                            ║
echo ║  📱 Accès depuis un autre appareil (même réseau):         ║
echo ║     http://[VOTRE_IP]:5000                                 ║
echo ║                                                            ║
echo ║  ⚠️  Pour arrêter le serveur: Fermez cette fenêtre        ║
echo ║     ou appuyez sur CTRL+C                                  ║
echo ║                                                            ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

REM Ouvrir automatiquement le navigateur après 2 secondes
start "" timeout /t 2 /nobreak >nul && start http://127.0.0.1:5000

REM Lancer l'application avec le Python du venv
venv\Scripts\python.exe app.py

echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║                   Serveur arrêté                           ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
pause
