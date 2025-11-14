# 🔧 Guide de Dépannage

## Problème: Le navigateur tourne en boucle sur localhost:5000

### Symptômes
- Le serveur Flask démarre correctement
- Aucun log "GET /" n'apparaît dans la console
- Le navigateur affiche "Connexion en cours..." ou tourne indéfiniment

### Solutions à essayer dans l'ordre

---

## ✅ Solution 1: Essayer 127.0.0.1 au lieu de localhost

**Problème:** Windows peut avoir des problèmes de résolution DNS pour "localhost"

**Action:**
1. Au lieu de `http://localhost:5000`
2. Essayez `http://127.0.0.1:5000` dans votre navigateur

---

## ✅ Solution 2: Configurer le Firewall Windows

**Problème:** Le firewall Windows bloque Python

**Action:**
1. Faites un **clic droit** sur `CONFIGURER_FIREWALL.bat`
2. Sélectionnez **"Exécuter en tant qu'administrateur"**
3. Relancez l'application avec `LANCER.bat`

**OU manuellement:**
1. Ouvrez "Pare-feu Windows Defender"
2. Cliquez sur "Paramètres avancés"
3. Cliquez sur "Règles de trafic entrant"
4. Cliquez sur "Nouvelle règle..."
5. Sélectionnez "Programme"
6. Parcourez jusqu'à: `C:\Users\ZAKARIA\Documents\vcamginozak\venv\Scripts\python.exe`
7. Autorisez la connexion
8. Appliquez à tous les profils

---

## ✅ Solution 3: Désactiver temporairement l'antivirus

**Problème:** L'antivirus bloque les connexions locales

**Action:**
1. Désactivez temporairement votre antivirus
2. Essayez d'accéder à `http://127.0.0.1:5000`
3. Si ça marche, ajoutez une exception pour Python dans l'antivirus

---

## ✅ Solution 4: Vérifier avec le test simple

**Action:**
1. Arrêtez l'application principale (CTRL+C)
2. Lancez: `python test_simple.py`
3. Essayez d'accéder à `http://127.0.0.1:5000`

Si le test simple fonctionne mais pas l'application principale, le problème vient du code.

---

## ✅ Solution 5: Essayer un autre navigateur

**Problème:** Votre navigateur a un problème de cache ou de proxy

**Action:**
1. Essayez avec un autre navigateur (Edge, Chrome, Firefox)
2. Ou ouvrez une fenêtre de navigation privée

---

## ✅ Solution 6: Vérifier le port 5000

**Problème:** Le port 5000 est peut-être déjà utilisé

**Action:**
1. Ouvrez PowerShell ou CMD
2. Exécutez:
   ```
   netstat -ano | findstr :5000
   ```
3. Si un processus utilise le port, tuez-le:
   ```
   taskkill /PID [numéro_du_PID] /F
   ```

---

## ✅ Solution 7: Modifier le port

**Action:**
Changez le port dans `app.py` ligne 213:
```python
app.run(host='0.0.0.0', port=8080, debug=False, threaded=True)
```

Puis accédez à `http://127.0.0.1:8080`

---

## ✅ Solution 8: Vérifier les logs détaillés

La nouvelle version de l'application affiche maintenant:
```
📥 Requête reçue: GET /
```

**Si vous voyez ce message:** Le serveur reçoit bien la requête, le problème est dans le code
**Si vous ne voyez PAS ce message:** Le navigateur n'atteint pas le serveur (firewall/réseau)

---

## 🆘 Diagnostic complet

### Test 1: Ping local
```cmd
ping 127.0.0.1
```
Devrait répondre immédiatement

### Test 2: Telnet (test de connexion au port)
```cmd
telnet 127.0.0.1 5000
```
- Si "Connexion établie": Le serveur écoute bien
- Si "Impossible de se connecter": Le serveur ne répond pas

**Note:** Si telnet n'est pas installé:
```cmd
# PowerShell
Test-NetConnection -ComputerName 127.0.0.1 -Port 5000
```

### Test 3: Curl (si installé)
```cmd
curl http://127.0.0.1:5000
```
Devrait retourner le HTML de la page

---

## 📞 Collecte d'informations

Si aucune solution ne fonctionne, collectez ces informations:

1. **Version de Python:**
   ```cmd
   python --version
   ```

2. **Version de Windows:**
   ```cmd
   winver
   ```

3. **État du firewall:**
   ```cmd
   netsh advfirewall show currentprofile
   ```

4. **Processus écoutant sur le port:**
   ```cmd
   netstat -ano | findstr :5000
   ```

5. **Message d'erreur exact du navigateur**

6. **Capture d'écran de la console Flask**

---

## 🎯 Solution Rapide pour 90% des cas

```cmd
# 1. Arrêtez l'application (CTRL+C)

# 2. Configurez le firewall en tant qu'admin
# Clic droit sur CONFIGURER_FIREWALL.bat -> Exécuter en tant qu'administrateur

# 3. Relancez l'application
python app.py

# 4. Dans le navigateur, utilisez:
http://127.0.0.1:5000
```

---

## ⚡ Mode Debug Avancé

Pour activer le mode debug complet:

1. Ouvrez `app.py`
2. Ligne 213, changez:
   ```python
   app.run(host='0.0.0.0', port=5000, debug=True, threaded=True)
   ```
3. Relancez l'application

Le mode debug affichera BEAUCOUP plus d'informations.
