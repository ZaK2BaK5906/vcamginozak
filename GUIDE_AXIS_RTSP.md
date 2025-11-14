# 📹 Guide RTSP pour Caméras Axis

## 🎯 Formats RTSP Axis OFFICIELS (RECOMMANDÉS)

### 🟢 Format ONVIF Standard (Compatible avec tous les appareils ONVIF)
```
rtsp://[username]:[password]@[IP]/onvif-media/media.amp
```

**Exemple:**
```
rtsp://root:password@192.168.1.100/onvif-media/media.amp
```

### 🟢 Format Axis Standard avec Port (Le plus utilisé)
```
rtsp://[username]:[password]@[IP]:554/axis-media/media.amp
```

**Exemple:**
```
rtsp://root:password@192.168.1.100:554/axis-media/media.amp
```

### 🟡 Format Axis Standard sans Port
```
rtsp://[username]:[password]@[IP]/axis-media/media.amp
```

**Exemple:**
```
rtsp://root:password@192.168.1.100/axis-media/media.amp
```

### ⚙️ Format avec Analytics (Métadonnées de scène)
```
rtsp://[username]:[password]@[IP]/axis-media/media.amp?camera=1&audio=0&video=0&analytics=polygon
```

**Note:** Nécessite AXIS OS 10.11 ou ultérieur et les analytics activés

---

## ⚡ Ordre de Test Recommandé (testez dans VLC)

Essayez ces URLs dans l'ordre suivant avec VLC Media Player:

### 1️⃣ **ONVIF Standard** (Compatible avec tous les appareils ONVIF)
```
rtsp://root:VOTRE_PASSWORD@IP_CAMERA/onvif-media/media.amp
```
✅ **Avantage:** Meilleure compatibilité inter-marques

### 2️⃣ **Axis Standard avec Port 554**
```
rtsp://root:VOTRE_PASSWORD@IP_CAMERA:554/axis-media/media.amp
```
✅ **Avantage:** Fonctionne sur la plupart des modèles Axis

### 3️⃣ **Axis Standard sans Port**
```
rtsp://root:VOTRE_PASSWORD@IP_CAMERA/axis-media/media.amp
```

### 4️⃣ **Avec codec H.264**
```
rtsp://root:VOTRE_PASSWORD@IP_CAMERA:554/axis-media/media.amp?videocodec=h264
```

### 5️⃣ **Anciens modèles Axis**
```
rtsp://root:VOTRE_PASSWORD@IP_CAMERA/mpeg4/media.amp
```

---

## 🔍 Méthode 1: Via l'interface Web Axis

1. **Accéder à la caméra:**
   ```
   http://192.168.1.100
   ```

2. **Connectez-vous:**
   - Username par défaut: `root`
   - Password: celui que vous avez défini

3. **Trouver l'URL RTSP:**
   - **Option A:** Setup → System Options → ONVIF
   - **Option B:** Setup → Video → Stream Profiles
   - **Option C:** Setup → Live View Config

4. **L'URL RTSP sera affichée**

---

## 📝 Formats RTSP selon le modèle Axis

### Modèles récents (2015+)
```
rtsp://root:password@192.168.1.100/axis-media/media.amp
rtsp://root:password@192.168.1.100/axis-media/media.amp?videocodec=h264
```

### Anciens modèles
```
rtsp://root:password@192.168.1.100/mpeg4/media.amp
rtsp://root:password@192.168.1.100/mpeg4/1/media.amp
```

### Avec résolution spécifique
```
# 1080p
rtsp://root:password@IP/axis-media/media.amp?resolution=1920x1080

# 720p
rtsp://root:password@IP/axis-media/media.amp?resolution=1280x720

# VGA
rtsp://root:password@IP/axis-media/media.amp?resolution=640x480
```

### Avec profil de stream
```
rtsp://root:password@IP/axis-media/media.amp?streamprofile=Quality
rtsp://root:password@IP/axis-media/media.amp?streamprofile=Balanced
rtsp://root:password@IP/axis-media/media.amp?streamprofile=Mobile
```

### Multi-canaux (caméras avec plusieurs capteurs)
```
# Canal 1
rtsp://root:password@IP/axis-media/media.amp?camera=1

# Canal 2
rtsp://root:password@IP/axis-media/media.amp?camera=2
```

---

## 🧪 Méthode 2: Tester avec VLC Media Player

1. **Téléchargez VLC** (si pas installé):
   - https://www.videolan.org/

2. **Ouvrir un flux réseau:**
   - Ouvrez VLC
   - Média → Ouvrir un flux réseau (ou CTRL+N)

3. **Testez ces URLs dans l'ordre:**
   ```
   rtsp://root:VOTRE_PASSWORD@192.168.1.100/axis-media/media.amp
   rtsp://root:VOTRE_PASSWORD@192.168.1.100/axis-media/media.amp?videocodec=h264
   rtsp://root:VOTRE_PASSWORD@192.168.1.100/mpeg4/media.amp
   ```

4. **Si l'image s'affiche dans VLC:**
   - ✅ L'URL fonctionne
   - Copiez-la pour l'utiliser dans notre application

---

## 🛠️ Méthode 3: Via ONVIF Device Manager

1. **Téléchargez ONVIF Device Manager:**
   - https://sourceforge.net/projects/onvifdm/

2. **Scannez le réseau:**
   - Lancez ONVIF Device Manager
   - Il détectera automatiquement les caméras

3. **Trouvez votre caméra Axis:**
   - Faites un clic droit → Live Video
   - L'URL RTSP sera affichée en bas

---

## 📱 Méthode 4: Via l'application AXIS IP Utility

1. **Téléchargez AXIS IP Utility:**
   - https://www.axis.com/support/tools/axis-ip-utility

2. **Scannez le réseau:**
   - L'outil détectera toutes les caméras Axis

3. **Cliquez sur votre caméra:**
   - Vous verrez l'IP et les informations
   - Ouvrez l'interface web depuis l'outil

---

## 🔐 Identifiants par défaut Axis

### Username par défaut:
```
root
```

### Password:
- **Première installation:** Vous devez créer un mot de passe
- **Si configuré:** Utilisez le mot de passe défini
- **Si oublié:** Reset de la caméra nécessaire

### Ports par défaut:
- **HTTP:** 80
- **RTSP:** 554
- **HTTPS:** 443

---

## ⚙️ Paramètres RTSP avancés

### Modifier le framerate (fps)
```
rtsp://root:password@IP/axis-media/media.amp?fps=15
rtsp://root:password@IP/axis-media/media.amp?fps=30
```

### Modifier le bitrate
```
rtsp://root:password@IP/axis-media/media.amp?videobitrate=500
rtsp://root:password@IP/axis-media/media.amp?videobitrate=2000
```

### Combinaison de paramètres
```
rtsp://root:password@IP/axis-media/media.amp?videocodec=h264&resolution=1280x720&fps=25
```

---

## 🎯 URLs RTSP testées pour modèles Axis populaires

### Axis M Series (M1065, M3047, etc.)
```
rtsp://root:password@IP/axis-media/media.amp
```

### Axis P Series (P1448, P3245, etc.)
```
rtsp://root:password@IP/axis-media/media.amp?videocodec=h264
```

### Axis Q Series (Q1615, Q6075, etc.)
```
rtsp://root:password@IP/axis-media/media.amp?streamprofile=Quality
```

### Axis F Series (F34, F44, etc.)
```
# Flux principal
rtsp://root:password@IP/axis-media/media.amp?camera=1

# Flux secondaire
rtsp://root:password@IP/axis-media/media.amp?camera=2
```

---

## 🚨 Dépannage

### Problème: "Connection refused"
- Vérifiez que le port RTSP (554) n'est pas bloqué
- Vérifiez dans Setup → System Options → Ports & Devices → RTSP

### Problème: "Authentication failed"
- Vérifiez username/password
- Username par défaut: `root`
- Essayez de vous connecter via l'interface web d'abord

### Problème: "Stream not found"
- Essayez les différents formats mentionnés ci-dessus
- Vérifiez que le streaming RTSP est activé:
  - Setup → System Options → Security → RTSP → Enable

### Problème: "Timeout"
- Vérifiez que la caméra est accessible (ping)
- Vérifiez le firewall de votre PC
- Vérifiez que vous êtes sur le même réseau

---

## 📋 Checklist de configuration Axis

- [ ] Trouvez l'IP de la caméra (AXIS IP Utility ou routeur)
- [ ] Connectez-vous à l'interface web (http://IP)
- [ ] Vérifiez que RTSP est activé
- [ ] Testez l'URL RTSP dans VLC
- [ ] Si ça marche dans VLC, utilisez la même URL dans l'application

---

## 💡 Conseils

1. **Toujours tester avec VLC d'abord** avant d'utiliser l'URL dans l'application
2. **Utilisez le flux secondaire** pour des performances optimales (résolution plus basse)
3. **Activez ONVIF** dans les paramètres Axis pour une meilleure compatibilité
4. **Notez vos URLs** qui fonctionnent pour référence future

---

## 🔗 Ressources officielles Axis

- Documentation RTSP Axis: https://www.axis.com/support/tools
- AXIS IP Utility: https://www.axis.com/support/tools/axis-ip-utility
- Support Axis: https://www.axis.com/support

---

## 📞 Exemple d'utilisation dans notre application

1. Trouvez votre URL RTSP (exemple: `rtsp://root:12345@192.168.1.100/axis-media/media.amp`)
2. Ouvrez l'application: `http://127.0.0.1:5000`
3. Cliquez sur "+ Ajouter une Caméra"
4. Nom: `Caméra Axis Entrée`
5. URL RTSP: `rtsp://root:12345@192.168.1.100/axis-media/media.amp`
6. Cliquez sur "Ajouter"
