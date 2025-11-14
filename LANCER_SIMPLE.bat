@echo off
chcp 65001 >nul
color 0B
title Multi-Caméras RTSP - Lancement Simple

echo ╔════════════════════════════════════════════════════════════╗
echo ║         Application Multi-Caméras RTSP - Démarrage         ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

echo 🚀 Démarrage du serveur...
echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║                  🌐 SERVEUR EN COURS 🌐                    ║
echo ╠════════════════════════════════════════════════════════════╣
echo ║                                                            ║
echo ║  Accédez à l'application:                                  ║
echo ║                                                            ║
echo ║     http://127.0.0.1:5000                                  ║
echo ║                                                            ║
echo ║  ⚠️  Pour arrêter: Fermez cette fenêtre ou CTRL+C         ║
echo ║                                                            ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

REM Ouvrir le navigateur automatiquement
start "" timeout /t 2 /nobreak >nul && start http://127.0.0.1:5000

REM Lancer l'application directement (sans venv)
python app.py

echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║                   Serveur arrêté                           ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
pause
