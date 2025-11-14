# 🎛️ Optimisation des Flux RTSP Axis - API Adjustable Stream

## 📌 URLs Optimisées pour votre Caméra (192.168.1.23)

### 🟢 URL de Base avec Optimisations

```
# Flux standard avec ajustements activés
rtsp://root:Tank2024%21@192.168.1.23/axis-media/media.amp?adjustablelivestream=1

# Flux mpeg4 (ancien modèle) avec ajustements
rtsp://root:Tank2024%21@192.168.1.23/mpeg4/media.amp?adjustablelivestream=1

# ONVIF avec ajustements
rtsp://root:Tank2024%21@192.168.1.23/onvif-media/media.amp?adjustablelivestream=1
```

---

## ⚡ URLs OPTIMISÉES POUR PERFORMANCES

### 🔴 Haute Qualité (Pour enregistrement)
```
rtsp://root:Tank2024%21@192.168.1.23/axis-media/media.amp?fps=30&compression=10&videomaxbitrate=4000000&resolution=1920x1080
```

### 🟡 Qualité Moyenne (Recommandé pour surveillance temps réel)
```
rtsp://root:Tank2024%21@192.168.1.23/axis-media/media.amp?fps=15&compression=30&videomaxbitrate=1000000&resolution=1280x720
```

### 🟢 Basse Qualité (Performances maximales, plusieurs caméras)
```
rtsp://root:Tank2024%21@192.168.1.23/axis-media/media.amp?fps=10&compression=50&videomaxbitrate=500000&resolution=640x480
```

### ⚙️ Avec Ajustements Dynamiques Activés
```
rtsp://root:Tank2024%21@192.168.1.23/axis-media/media.amp?adjustablelivestream=1&fps=15&compression=30&videomaxbitrate=1000000&resolution=1280x720
```

---

## 🎯 Paramètres Ajustables en Temps Réel

Avec `adjustablelivestream=1`, vous pouvez modifier ces paramètres SANS redémarrer le flux:

| Paramètre | Description | Valeurs Recommandées |
|-----------|-------------|---------------------|
| `fps` | Images par seconde | 10-30 (15 recommandé) |
| `compression` | Taux de compression JPEG | 10-100 (30 recommandé) |
| `videomaxbitrate` | Débit max en bits/sec | 500000-4000000 |
| `videokeyframeinterval` | Intervalle des keyframes | 16-128 |
| `videozstrength` | Force de la compression H.264 | 1-20 |

---

## 📋 URLs à Tester DANS L'ORDRE (VLC)

### 1️⃣ **Test de Connectivité Basique**
```
rtsp://root:Tank2024%21@192.168.1.23/mpeg4/media.amp
```

### 2️⃣ **Avec Port Explicite**
```
rtsp://root:Tank2024%21@192.168.1.23:554/mpeg4/media.amp
```

### 3️⃣ **Format Axis Standard**
```
rtsp://root:Tank2024%21@192.168.1.23/axis-media/media.amp
```

### 4️⃣ **ONVIF Standard**
```
rtsp://root:Tank2024%21@192.168.1.23/onvif-media/media.amp
```

### 5️⃣ **Avec Optimisations (720p, 15fps)**
```
rtsp://root:Tank2024%21@192.168.1.23/axis-media/media.amp?resolution=1280x720&fps=15&compression=30
```

### 6️⃣ **Avec Codec H.264**
```
rtsp://root:Tank2024%21@192.168.1.23/axis-media/media.amp?videocodec=h264
```

### 7️⃣ **Flux Secondaire (Plus Rapide)**
```
rtsp://root:Tank2024%21@192.168.1.23/axis-media/media.amp?streamprofile=Mobile
rtsp://root:Tank2024%21@192.168.1.23/axis-media/media.amp?streamprofile=Balanced
```

---

## 🔧 Configuration pour Application Multi-Caméras

### Pour 1-2 Caméras (Haute Qualité)
```json
{
    "name": "Caméra Axis Entrée",
    "rtsp_url": "rtsp://root:Tank2024%21@192.168.1.23/axis-media/media.amp?resolution=1280x720&fps=25&compression=20&videomaxbitrate=2000000"
}
```

### Pour 3-4 Caméras (Qualité Moyenne)
```json
{
    "name": "Caméra Axis Entrée",
    "rtsp_url": "rtsp://root:Tank2024%21@192.168.1.23/axis-media/media.amp?resolution=1280x720&fps=15&compression=30&videomaxbitrate=1000000"
}
```

### Pour 5-9 Caméras (Performances)
```json
{
    "name": "Caméra Axis Entrée",
    "rtsp_url": "rtsp://root:Tank2024%21@192.168.1.23/axis-media/media.amp?resolution=640x480&fps=10&compression=40&videomaxbitrate=500000"
}
```

---

## 🚀 Guide d'Optimisation Progressif

### Étape 1: Connexion de Base
```
rtsp://root:Tank2024%21@192.168.1.23/mpeg4/media.amp
```
✅ **Objectif:** Vérifier que la connexion fonctionne dans VLC

### Étape 2: Format Moderne
```
rtsp://root:Tank2024%21@192.168.1.23/axis-media/media.amp
```
✅ **Objectif:** Utiliser le format standard Axis

### Étape 3: Ajout de la Résolution
```
rtsp://root:Tank2024%21@192.168.1.23/axis-media/media.amp?resolution=1280x720
```
✅ **Objectif:** Contrôler la résolution

### Étape 4: Ajout FPS
```
rtsp://root:Tank2024%21@192.168.1.23/axis-media/media.amp?resolution=1280x720&fps=15
```
✅ **Objectif:** Réduire la charge processeur

### Étape 5: Compression
```
rtsp://root:Tank2024%21@192.168.1.23/axis-media/media.amp?resolution=1280x720&fps=15&compression=30
```
✅ **Objectif:** Optimiser la bande passante

### Étape 6: Bitrate Maximum
```
rtsp://root:Tank2024%21@192.168.1.23/axis-media/media.amp?resolution=1280x720&fps=15&compression=30&videomaxbitrate=1000000
```
✅ **Objectif:** Stabiliser le flux

---

## 🎛️ Paramètres Détaillés

### FPS (Images par Seconde)
```
fps=5    → Très fluide (surveillance basique)
fps=10   → Fluide suffisant
fps=15   → Bon compromis (RECOMMANDÉ)
fps=25   → Haute fluidité
fps=30   → Maximum (gourmand)
```

### Compression (Qualité JPEG)
```
compression=10  → Qualité maximale (gros fichiers)
compression=30  → Bon compromis (RECOMMANDÉ)
compression=50  → Qualité acceptable
compression=70  → Basse qualité
```

### Bitrate Maximum
```
videomaxbitrate=500000   → 500 Kbps (basse qualité)
videomaxbitrate=1000000  → 1 Mbps (RECOMMANDÉ)
videomaxbitrate=2000000  → 2 Mbps (haute qualité)
videomaxbitrate=4000000  → 4 Mbps (très haute qualité)
```

### Résolution
```
resolution=640x480    → VGA (rapide, plusieurs caméras)
resolution=1280x720   → 720p (RECOMMANDÉ)
resolution=1920x1080  → 1080p (haute qualité)
```

---

## 🧪 Test de Diagnostic Complet

### Test 1: Connectivité Réseau
```cmd
ping 192.168.1.23
```
✅ Doit répondre en < 10ms

### Test 2: Port RTSP
```powershell
Test-NetConnection -ComputerName 192.168.1.23 -Port 554
```
✅ TcpTestSucceeded doit être True

### Test 3: Interface Web
```
http://192.168.1.23
```
✅ Page de login doit s'afficher

### Test 4: VLC Basique
```
rtsp://root:Tank2024%21@192.168.1.23/mpeg4/media.amp
```
✅ Image doit apparaître

### Test 5: VLC Optimisé
```
rtsp://root:Tank2024%21@192.168.1.23/axis-media/media.amp?resolution=1280x720&fps=15&compression=30
```
✅ Image fluide et stable

---

## 💡 Conseils d'Optimisation

### Pour Réseau Local (LAN)
```
# Haute qualité possible
resolution=1920x1080
fps=25
compression=20
videomaxbitrate=4000000
```

### Pour Réseau WiFi
```
# Qualité moyenne stable
resolution=1280x720
fps=15
compression=30
videomaxbitrate=1000000
```

### Pour Plusieurs Caméras (4+)
```
# Performance maximale
resolution=640x480
fps=10
compression=40
videomaxbitrate=500000
```

### Pour Enregistrement 24/7
```
# Balance qualité/stockage
resolution=1280x720
fps=10
compression=35
videomaxbitrate=800000
```

---

## 🚨 Résolution de Problèmes

### Problème: Image saccadée
**Solution:** Réduisez le FPS
```
fps=10 ou fps=15
```

### Problème: Latence élevée
**Solution:** Réduisez la résolution et le bitrate
```
resolution=640x480&videomaxbitrate=500000
```

### Problème: Déconnexions fréquentes
**Solution:** Ajoutez un buffer
```
# Dans OpenCV (côté application)
cap.set(cv2.CAP_PROP_BUFFERSIZE, 1)
```

### Problème: Qualité trop basse
**Solution:** Augmentez la compression (valeur plus basse)
```
compression=20 (au lieu de 30)
```

---

## 📝 Exemples pour Notre Application

### Configuration cameras_config.json Optimisée

```json
{
    "cameras": [
        {
            "id": "cam_1",
            "name": "Caméra Axis 192.168.1.23 - Qualité Optimale",
            "rtsp_url": "rtsp://root:Tank2024%21@192.168.1.23/axis-media/media.amp?resolution=1280x720&fps=15&compression=30&videomaxbitrate=1000000",
            "enabled": true
        },
        {
            "id": "cam_2",
            "name": "Caméra Axis 192.168.1.23 - Performance",
            "rtsp_url": "rtsp://root:Tank2024%21@192.168.1.23/axis-media/media.amp?resolution=640x480&fps=10&compression=40&videomaxbitrate=500000",
            "enabled": false
        },
        {
            "id": "cam_3",
            "name": "Caméra Axis 192.168.1.23 - MPEG4 Basique",
            "rtsp_url": "rtsp://root:Tank2024%21@192.168.1.23/mpeg4/media.amp",
            "enabled": false
        }
    ]
}
```

---

## 🎯 URL RECOMMANDÉE POUR VOUS

Basé sur votre caméra à 192.168.1.23, utilisez cette URL:

### Pour 1-2 caméras:
```
rtsp://root:Tank2024%21@192.168.1.23/axis-media/media.amp?resolution=1280x720&fps=15&compression=25&videomaxbitrate=1500000
```

### Pour 3-4 caméras:
```
rtsp://root:Tank2024%21@192.168.1.23/axis-media/media.amp?resolution=1280x720&fps=15&compression=30&videomaxbitrate=1000000
```

### Pour 5+ caméras:
```
rtsp://root:Tank2024%21@192.168.1.23/axis-media/media.amp?resolution=640x480&fps=10&compression=40&videomaxbitrate=500000
```

---

## 📞 Checklist de Mise en Route

- [ ] Ping 192.168.1.23 fonctionne
- [ ] http://192.168.1.23 accessible
- [ ] VLC affiche l'image avec URL basique
- [ ] VLC affiche l'image avec URL optimisée
- [ ] Application lancée (LANCER.bat)
- [ ] http://127.0.0.1:5000 accessible
- [ ] Caméra ajoutée dans l'application
- [ ] Image s'affiche dans l'application

---

## 🔗 Ressources

- Guide complet: GUIDE_AXIS_RTSP.md
- Test caméra: TEST_CAMERA_192.168.1.23.txt
- URLs rapides: URLS_AXIS_RAPIDE.txt
