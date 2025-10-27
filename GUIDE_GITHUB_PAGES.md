# 🚀 GUIDE HÉBERGEMENT GITHUB PAGES
## Straven Essential Dashboard

---

## 📋 ÉTAPES COMPLÈTES

### 1️⃣ **CRÉER LE DÉPÔT GITHUB**

1. Aller sur https://github.com
2. Cliquer sur **"New repository"** (bouton vert)
3. Paramètres :
   - **Repository name** : `straven-essential` (ou votre choix)
   - **Description** : "Dashboard centralisé pour applications essentielles"
   - **Public** ✅ (obligatoire pour GitHub Pages gratuit)
   - ❌ Ne pas cocher "Add a README"
   - ❌ Ne pas ajouter .gitignore
   - ❌ Ne pas choisir de licence (pour l'instant)
4. Cliquer sur **"Create repository"**

📝 **Notez l'URL** : `https://github.com/VOTRE_USERNAME/straven-essential`

---

### 2️⃣ **INITIALISER GIT LOCALEMENT**

Exécutez ces commandes dans le terminal :

```bash
cd "/home/oumvr667/Bureau/university/application web/projet/straven oumar essentiel"

# Initialiser Git
git init

# Configurer votre identité (si pas déjà fait)
git config user.name "Votre Nom"
git config user.email "votre.email@example.com"

# Ajouter tous les fichiers
git add .

# Premier commit
git commit -m "🎉 Initial commit - Straven Essential Dashboard v2"
```

---

### 3️⃣ **LIER AU DÉPÔT GITHUB**

⚠️ **IMPORTANT** : Remplacez `VOTRE_USERNAME` par votre nom d'utilisateur GitHub !

```bash
# Ajouter le dépôt distant
git remote add origin https://github.com/VOTRE_USERNAME/straven-essential.git

# Renommer la branche en 'main' (standard moderne)
git branch -M main

# Pousser vers GitHub
git push -u origin main
```

Si GitHub demande vos identifiants :
- **Username** : votre nom d'utilisateur GitHub
- **Password** : utilisez un **Personal Access Token** (pas votre mot de passe)

---

### 4️⃣ **ACTIVER GITHUB PAGES**

1. Aller sur votre dépôt : `https://github.com/VOTRE_USERNAME/straven-essential`
2. Cliquer sur **"Settings"** (⚙️ en haut à droite)
3. Dans le menu de gauche, cliquer sur **"Pages"**
4. Dans **"Source"** :
   - **Branch** : sélectionner `main`
   - **Folder** : sélectionner `/root` ou `/` (racine)
5. Cliquer sur **"Save"**

⏱️ Attendre 1-2 minutes que GitHub déploie votre site.

---

### 5️⃣ **STRUCTURE DES FICHIERS POUR GITHUB PAGES**

GitHub Pages cherche un fichier `index.html` à la racine. Il faut donc **réorganiser** :

```
straven-essential/
├── index.html          ← Version 2 (renommé et déplacé)
├── style.css           ← Version 2 CSS
├── img/
│   ├── head_bg.png
│   ├── og-image.png
│   └── icons/
│       └── favicon/
├── .htaccess           ← Configuration Apache
├── robots.txt
├── sitemap.xml
└── docs/               ← Documentation
    ├── PERFORMANCE_GUIDE.md
    ├── SEO_AUDIT.md
    └── DESIGN_SYSTEM.md
```

---

### 6️⃣ **RÉORGANISER LES FICHIERS (AUTOMATIQUE)**

Un script va créer cette structure :

```bash
./prepare_github_pages.sh
```

---

### 7️⃣ **VOTRE URL FINALE**

Après activation de GitHub Pages, votre site sera accessible à :

```
https://VOTRE_USERNAME.github.io/straven-essential/
```

Exemple : `https://john-doe.github.io/straven-essential/`

---

## 🔧 CONFIGURATION PERSONNALISÉE

### **Utiliser un Domaine Personnalisé** (Optionnel)

Si vous avez un nom de domaine (ex: `straven.com`) :

1. Dans **GitHub Settings → Pages**
2. Section **"Custom domain"**
3. Entrer votre domaine : `www.straven.com`
4. Cocher **"Enforce HTTPS"**
5. Configurer votre DNS :
   - Type `CNAME` → `VOTRE_USERNAME.github.io`

---

## 📝 COMMANDES GIT UTILES

### Mettre à jour le site après modifications :

```bash
# Voir les fichiers modifiés
git status

# Ajouter les modifications
git add .

# Créer un commit
git commit -m "✨ Description de vos modifications"

# Pousser vers GitHub
git push
```

### Mettre à jour le sitemap.xml :

Modifier `sitemap.xml` pour utiliser votre vraie URL :

```xml
<loc>https://VOTRE_USERNAME.github.io/straven-essential/</loc>
```

---

## ⚠️ PROBLÈMES COURANTS

### ❌ "Page not found" (404)

**Causes possibles** :
1. GitHub Pages pas encore activé (Settings → Pages)
2. Pas de fichier `index.html` à la racine
3. Branche incorrecte sélectionnée dans Pages

**Solution** : Exécuter le script de préparation et activer Pages

---

### ❌ "Images ne s'affichent pas"

**Cause** : Chemins relatifs incorrects

**Solution** : Utiliser des chemins relatifs depuis la racine :
```html
<img src="img/icons/outlook.png">  ✅
<img src="../../img/icons/outlook.png">  ❌
```

Le script de préparation corrige automatiquement les chemins.

---

### ❌ "Git demande un mot de passe en boucle"

**Cause** : GitHub n'accepte plus les mots de passe classiques

**Solution** : Créer un Personal Access Token (PAT)

1. GitHub → Settings → Developer settings → Personal access tokens
2. Generate new token (classic)
3. Permissions : `repo` (cocher toute la section)
4. Générer et copier le token
5. Utiliser ce token comme mot de passe

**OU** utiliser SSH :
```bash
git remote set-url origin git@github.com:VOTRE_USERNAME/straven-essential.git
```

---

## 🎯 CHECKLIST AVANT PUBLICATION

- [ ] Convertir `head_bg.png` en WebP (optionnel mais recommandé)
- [ ] Créer `img/og-image.png` (1200x630px)
- [ ] Mettre à jour les URLs dans `sitemap.xml`
- [ ] Mettre à jour les URLs dans `index.html` (Open Graph, Twitter Cards)
- [ ] Tester localement : `python3 -m http.server 8000`
- [ ] Vérifier que toutes les images s'affichent
- [ ] Initialiser Git et faire le premier commit
- [ ] Créer le dépôt GitHub
- [ ] Pousser le code
- [ ] Activer GitHub Pages
- [ ] Attendre 1-2 minutes
- [ ] Visiter `https://VOTRE_USERNAME.github.io/straven-essential/`
- [ ] Tester avec PageSpeed Insights

---

## 📊 APRÈS PUBLICATION

### Tester les performances :
- PageSpeed Insights : https://pagespeed.web.dev/
- WebPageTest : https://webpagetest.org/

### Soumettre à Google :
1. Google Search Console : https://search.google.com/search-console
2. Ajouter la propriété avec votre URL GitHub Pages
3. Soumettre le sitemap : `https://VOTRE_USERNAME.github.io/straven-essential/sitemap.xml`

### Suivre les visites :
- Google Analytics (gratuit)
- Plausible Analytics (privacy-focused)
- GitHub Traffic (dans votre dépôt → Insights → Traffic)

---

## 🚀 SCRIPT DE PRÉPARATION

Un script automatique va :
1. ✅ Créer la structure correcte pour GitHub Pages
2. ✅ Déplacer les fichiers de version 2 à la racine
3. ✅ Corriger les chemins relatifs dans HTML et CSS
4. ✅ Organiser la documentation dans un dossier `docs/`
5. ✅ Créer un `.gitignore` adapté
6. ✅ Créer un `README.md` pour GitHub

**Exécuter** : `./prepare_github_pages.sh`

---

## 📞 AIDE

- Documentation GitHub Pages : https://docs.github.com/pages
- Guide Git : https://git-scm.com/book/fr/v2
- Personal Access Token : https://github.com/settings/tokens

**Bon déploiement !** 🎉
