@echo off
title Configuration du Firewall pour l'Application Multi-Caméras
echo ╔════════════════════════════════════════════════════════════╗
echo ║     Configuration du Firewall Windows                      ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
echo Ce script va ajouter une règle au firewall Windows pour
echo autoriser Python à accepter les connexions entrantes.
echo.
echo ⚠️  Exécutez ce fichier en tant qu'ADMINISTRATEUR
echo    (Clic droit -> Exécuter en tant qu'administrateur)
echo.
pause

echo.
echo [1/2] Suppression des anciennes règles (si elles existent)...
netsh advfirewall firewall delete rule name="Python Flask App" >nul 2>&1

echo.
echo [2/2] Ajout de la nouvelle règle...
netsh advfirewall firewall add rule name="Python Flask App" dir=in action=allow program="%CD%\venv\Scripts\python.exe" enable=yes profile=any

if errorlevel 1 (
    echo ❌ Erreur: Ce script doit être exécuté en tant qu'administrateur
    echo.
    echo 👉 Faites un clic droit sur ce fichier et sélectionnez
    echo    "Exécuter en tant qu'administrateur"
    pause
    exit /b 1
)

echo.
echo ✅ Règle de firewall ajoutée avec succès!
echo.
echo Vous pouvez maintenant relancer l'application avec LANCER.bat
echo.
pause
