@echo off
chcp 65001 >nul
color 0C
title Correction de l'installation

echo ╔════════════════════════════════════════════════════════════╗
echo ║         Correction du problème d'installation              ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

echo Problème détecté: Python 3.13 + versions incompatibles
echo.

echo [1/5] Suppression de l'ancien environnement virtuel...
if exist venv (
    echo Suppression du dossier venv...
    rmdir /s /q venv
    echo ✅ Ancien venv supprimé
) else (
    echo ℹ️  Pas d'ancien venv à supprimer
)

echo.
echo [2/5] Création d'un nouvel environnement virtuel...
python -m venv venv
if errorlevel 1 (
    echo ❌ Erreur lors de la création du venv
    pause
    exit /b 1
)
echo ✅ Venv créé

echo.
echo [3/5] Mise à jour de pip et installation de setuptools...
venv\Scripts\python.exe -m pip install --upgrade pip setuptools wheel
if errorlevel 1 (
    echo ❌ Erreur lors de l'installation de setuptools
    pause
    exit /b 1
)
echo ✅ Pip et setuptools mis à jour

echo.
echo [4/5] Installation des dépendances compatibles Python 3.13...
venv\Scripts\python.exe -m pip install -r requirements.txt
if errorlevel 1 (
    echo ❌ Erreur lors de l'installation des dépendances
    echo.
    echo Essai avec des versions moins strictes...
    venv\Scripts\python.exe -m pip install Flask opencv-python numpy Werkzeug
    if errorlevel 1 (
        echo ❌ Échec de l'installation
        pause
        exit /b 1
    )
)
echo ✅ Dépendances installées

echo.
echo [5/5] Vérification de l'installation...
venv\Scripts\python.exe -c "import flask, cv2, numpy; print('✅ Tous les modules sont importables')"
if errorlevel 1 (
    echo ⚠️  Problème avec les imports
    pause
    exit /b 1
)

echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║              🎉 Installation Corrigée! 🎉                  ║
echo ╠════════════════════════════════════════════════════════════╣
echo ║                                                            ║
echo ║  Pour lancer l'application:                                ║
echo ║  👉 Double-cliquez sur LANCER.bat                         ║
echo ║                                                            ║
echo ║  Puis accédez à: http://127.0.0.1:5000                     ║
echo ║                                                            ║
echo ╚════════════════════════════════════════════════════════════╝
echo.

pause
