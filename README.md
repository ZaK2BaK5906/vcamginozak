# 📹 Application Multi-Caméras RTSP

Application web localhost pour Windows permettant de visualiser plusieurs flux RTSP de différentes caméras simultanément.

## 🚀 Fonctionnalités

- ✅ Affichage simultané de plusieurs caméras RTSP
- ✅ Interface web moderne et responsive
- ✅ Grilles configurables (1x1, 2x2, 3x3, 4x4)
- ✅ Ajout/Suppression dynamique de caméras
- ✅ Activation/Désactivation des flux
- ✅ Reconnexion automatique en cas de perte de signal
- ✅ Configuration persistante (fichier JSON)
- ✅ Compatible avec toutes les caméras RTSP

## 📋 Prérequis

- Python 3.8 ou supérieur
- Windows 10/11
- Connexion réseau aux caméras RTSP

## 🔧 Installation

### Méthode 1: Installation Automatique (Recommandée)

1. Double-cliquez sur `INSTALLER.bat`
2. Attendez la fin de l'installation
3. Double-cliquez sur `LANCER.bat` pour démarrer l'application

### Méthode 2: Installation Manuelle

1. Ouvrez un terminal (CMD ou PowerShell) dans le dossier du projet

2. Créez un environnement virtuel:
```bash
python -m venv venv
```

3. Activez l'environnement virtuel:
```bash
venv\Scripts\activate
```

4. Installez les dépendances:
```bash
pip install -r requirements.txt
```

5. Lancez l'application:
```bash
python app.py
```

## 🎯 Utilisation

1. **Démarrer l'application:**
   - Double-cliquez sur `LANCER.bat`
   - Ou exécutez `python app.py` dans le terminal

2. **Accéder à l'interface:**
   - Ouvrez votre navigateur
   - Allez sur: `http://localhost:5000`

3. **Ajouter une caméra:**
   - Cliquez sur "+ Ajouter une Caméra"
   - Entrez le nom de la caméra
   - Entrez l'URL RTSP (format: `rtsp://[user]:[pass]@[ip]:[port]/[path]`)
   - Cliquez sur "Ajouter"

4. **Gérer les caméras:**
   - ▶️/⏸️ : Activer/Désactiver le flux
   - 🗑️ : Supprimer la caméra
   - Boutons 1x1, 2x2, 3x3, 4x4 : Changer la disposition

## 📝 Configuration

Le fichier `cameras_config.json` contient la configuration des caméras:

```json
{
    "cameras": [
        {
            "id": "cam_1",
            "name": "Caméra Entrée",
            "rtsp_url": "rtsp://admin:password@192.168.1.100:554/stream1",
            "enabled": true
        }
    ]
}
```

Vous pouvez éditer ce fichier manuellement ou utiliser l'interface web.

## 🔌 Formats d'URL RTSP Supportés

### Exemples courants:

```
# Avec authentification
rtsp://admin:password@192.168.1.100:554/stream1

# Sans authentification
rtsp://192.168.1.101:554/h264_stream

# Avec nom de domaine
rtsp://user:pass@camera.local/live/main

# Hikvision
rtsp://admin:password@192.168.1.64:554/Streaming/Channels/101

# Dahua
rtsp://admin:password@192.168.1.108:554/cam/realmonitor?channel=1&subtype=0

# TP-Link
rtsp://admin:password@192.168.1.50:554/stream1

# Reolink
rtsp://admin:password@192.168.1.70:554/h264Preview_01_main

# Axis
rtsp://root:password@192.168.1.80/axis-media/media.amp
```

## 🛠️ Dépannage

### La caméra ne s'affiche pas

1. Vérifiez l'URL RTSP dans VLC Media Player
2. Vérifiez que la caméra est accessible sur le réseau
3. Vérifiez les identifiants (username/password)
4. Vérifiez le port (généralement 554)

### L'image est saccadée

1. Réduisez le nombre de caméras affichées
2. Vérifiez votre bande passante réseau
3. Utilisez un flux de qualité inférieure si disponible

### Erreur de connexion

1. Vérifiez que Python est bien installé
2. Vérifiez que les dépendances sont installées
3. Relancez l'application en mode administrateur

## 📦 Structure du Projet

```
vcamginozak/
├── app.py                  # Application Flask principale
├── cameras_config.json     # Configuration des caméras
├── requirements.txt        # Dépendances Python
├── INSTALLER.bat          # Script d'installation Windows
├── LANCER.bat             # Script de lancement Windows
├── README.md              # Ce fichier
├── templates/
│   └── index.html         # Template HTML principal
└── static/
    ├── css/
    │   └── style.css      # Styles CSS
    └── js/
        └── app.js         # JavaScript frontend
```

## 🌐 Accès depuis d'autres appareils

Pour accéder à l'application depuis un autre appareil sur le même réseau:

1. Trouvez l'adresse IP de votre PC Windows:
   ```bash
   ipconfig
   ```

2. Sur l'autre appareil, accédez à:
   ```
   http://[VOTRE_IP]:5000
   ```

## 🔒 Sécurité

⚠️ **Important:**
- Cette application est conçue pour un usage LOCAL uniquement
- Ne l'exposez PAS directement sur Internet
- Utilisez un VPN pour l'accès à distance
- Changez les mots de passe par défaut de vos caméras

## 📞 Support

Pour toute question ou problème:
1. Vérifiez la section Dépannage
2. Consultez les logs dans le terminal
3. Vérifiez la compatibilité RTSP de vos caméras

## 📄 Licence

MIT License - Libre d'utilisation et de modification

## 🎉 Crédits

Développé avec:
- Flask (Backend Python)
- OpenCV (Traitement vidéo)
- HTML/CSS/JavaScript (Interface utilisateur)
