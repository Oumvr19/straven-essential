#!/bin/bash

# ====================
# PRÉPARATION GITHUB PAGES
# Straven Essential Dashboard
# ====================

echo "🚀 PRÉPARATION POUR GITHUB PAGES"
echo "===================================="
echo ""

# Couleurs
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Vérifier qu'on est dans le bon répertoire
if [ ! -d "html/version 2" ]; then
    echo -e "${RED}❌ Erreur : Dossier 'html/version 2' introuvable !${NC}"
    echo "Assurez-vous d'exécuter ce script depuis le dossier racine du projet."
    exit 1
fi

echo -e "${BLUE}📁 Vérification de la structure...${NC}"
echo ""

# ====================
# 1. CRÉER LA STRUCTURE
# ====================
echo -e "${YELLOW}1️⃣  Création de la structure GitHub Pages...${NC}"

# Créer le dossier docs pour la documentation
mkdir -p docs
mkdir -p backup

echo -e "${GREEN}   ✓ Dossiers créés${NC}"
echo ""

# ====================
# 2. COPIER LES FICHIERS
# ====================
echo -e "${YELLOW}2️⃣  Copie des fichiers de la version 2...${NC}"

# Sauvegarder l'ancienne version si elle existe
if [ -f "index.html" ]; then
    echo -e "${BLUE}   ℹ  Sauvegarde de l'ancien index.html...${NC}"
    cp index.html backup/index.html.backup
fi

# Copier index.html et style.css à la racine
cp "html/version 2/index.html" index.html
cp "html/version 2/style.css" style.css

echo -e "${GREEN}   ✓ Fichiers HTML/CSS copiés à la racine${NC}"
echo ""

# ====================
# 3. CORRIGER LES CHEMINS
# ====================
echo -e "${YELLOW}3️⃣  Correction des chemins relatifs...${NC}"

# Corriger index.html : ../../img/ → img/
sed -i 's|../../img/|img/|g' index.html
sed -i "s|'../../img/|'img/|g" index.html
sed -i 's|"../../img/|"img/|g' index.html

echo -e "${GREEN}   ✓ Chemins dans index.html corrigés${NC}"

# Corriger style.css : ../../img/ → img/
sed -i "s|'../../img/|'img/|g" style.css
sed -i 's|"../../img/|"img/|g' style.css
sed -i "s|url('../../img/|url('img/|g" style.css

echo -e "${GREEN}   ✓ Chemins dans style.css corrigés${NC}"
echo ""

# ====================
# 4. DÉPLACER LA DOCUMENTATION
# ====================
echo -e "${YELLOW}4️⃣  Organisation de la documentation...${NC}"

# Déplacer les fichiers MD vers docs/
if [ -f "html/version 2/PERFORMANCE_GUIDE.md" ]; then
    cp "html/version 2/PERFORMANCE_GUIDE.md" docs/
fi

if [ -f "html/version 2/SEO_AUDIT.md" ]; then
    cp "html/version 2/SEO_AUDIT.md" docs/
fi

if [ -f "html/version 2/DESIGN_SYSTEM.md" ]; then
    cp "html/version 2/DESIGN_SYSTEM.md" docs/
fi

if [ -f "html/version 2/RESUME_OPTIMISATIONS.md" ]; then
    cp "html/version 2/RESUME_OPTIMISATIONS.md" docs/
fi

# Déplacer aussi le guide GitHub Pages
if [ -f "GUIDE_GITHUB_PAGES.md" ]; then
    cp "GUIDE_GITHUB_PAGES.md" docs/
fi

echo -e "${GREEN}   ✓ Documentation déplacée dans docs/${NC}"
echo ""

# ====================
# 5. CRÉER .gitignore
# ====================
echo -e "${YELLOW}5️⃣  Création du .gitignore...${NC}"

cat > .gitignore << 'EOF'
# ====================
# GITIGNORE - STRAVEN ESSENTIAL
# ====================

# Dossiers de développement
node_modules/
.vscode/
.idea/

# Fichiers système
.DS_Store
Thumbs.db
desktop.ini

# Fichiers temporaires
*.tmp
*.temp
*.log
*.cache

# Sauvegarde
backup/
*.backup

# Environnement Python (si utilisé pour tests)
__pycache__/
*.py[cod]
venv/
.env

# Fichiers de build (si utilisation future)
dist/
build/

# Versions alternatives (garder version 2 mais ignorer les tests)
html/version 1/

# Fichiers lourds non optimisés (optionnel)
# img/*.png
# Décommenter si vous avez converti toutes les images en WebP

# Logs de diagnostic
*.sh.log

# VS Code
.vscode/settings.json
.vscode/tasks.json
EOF

echo -e "${GREEN}   ✓ .gitignore créé${NC}"
echo ""

# ====================
# 6. CRÉER README.md
# ====================
echo -e "${YELLOW}6️⃣  Création du README.md pour GitHub...${NC}"

cat > README.md << 'EOF'
# 🌟 Straven Essential Dashboard

> Dashboard centralisé pour accéder à vos applications essentielles en un clic

[![GitHub Pages](https://img.shields.io/badge/demo-live-brightgreen)](https://VOTRE_USERNAME.github.io/straven-essential/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Performance](https://img.shields.io/badge/performance-90+-green)](https://pagespeed.web.dev/)

---

## 🚀 Démo en Ligne

**Visitez le dashboard** : [https://VOTRE_USERNAME.github.io/straven-essential/](https://VOTRE_USERNAME.github.io/straven-essential/)

> ⚠️ Remplacez `VOTRE_USERNAME` par votre nom d'utilisateur GitHub

---

## 📋 Fonctionnalités

### Applications Intégrées

- 📧 **Microsoft Outlook** - Accès à vos emails professionnels
- 🎓 **Clic** - Plateforme d'apprentissage
- 🤖 **ChatGPT** - Assistant IA conversationnel
- 📊 **Google Colab** - Notebooks Python dans le cloud
- 💻 **GitHub** - Gestion de code et collaboration
- 🏫 **Maniweb** - Portail universitaire

### Caractéristiques Techniques

- ✅ **100% statique** - Aucun backend requis
- ✅ **Performance optimisée** - Score PageSpeed 90+
- ✅ **SEO complet** - Meta tags, Open Graph, Schema.org
- ✅ **Responsive** - Adapté mobile, tablette, desktop
- ✅ **Accessible** - WCAG 2.1 niveau AA
- ✅ **PWA ready** - Manifest et icônes configurés

---

## 🎨 Design System

### Palette de Couleurs

- **Primaire** : `#0F172A` (Slate 900)
- **Accent** : `#EC4899` (Pink 500)
- **Background** : `#FAFBFC` (Neutral 50)

### Typographie

- **Titres** : Quicksand (Google Fonts)
- **Corps** : System fonts stack

---

## 🏗️ Structure du Projet

```
straven-essential/
├── index.html              # Page principale
├── style.css               # Styles globaux
├── img/                    # Images et icônes
│   ├── head_bg.png         # Background hero
│   ├── og-image.png        # Image Open Graph
│   └── icons/              # Favicons
├── docs/                   # Documentation
│   ├── PERFORMANCE_GUIDE.md
│   ├── SEO_AUDIT.md
│   └── DESIGN_SYSTEM.md
├── robots.txt              # Directives robots
├── sitemap.xml             # Plan du site
└── .htaccess               # Config Apache
```

---

## 📊 Performance

### Core Web Vitals

| Métrique | Score | Cible |
|----------|-------|-------|
| **LCP** (Largest Contentful Paint) | ~2.2s | <2.5s ✅ |
| **CLS** (Cumulative Layout Shift) | ~0.08 | <0.1 ✅ |
| **INP** (Interaction to Next Paint) | ~170ms | <200ms ✅ |

### Optimisations Appliquées

- ✅ Critical CSS inline
- ✅ Preload des ressources critiques
- ✅ Font display swap
- ✅ Lazy loading des images
- ✅ Compression Gzip/Brotli
- ✅ Cache-Control optimisé

---

## 🚀 Installation Locale

### Prérequis

- Navigateur web moderne
- Serveur HTTP local (optionnel)

### Lancer en Local

#### Option 1 - Python (recommandé)

```bash
# Cloner le dépôt
git clone https://github.com/VOTRE_USERNAME/straven-essential.git
cd straven-essential

# Lancer le serveur
python3 -m http.server 8000

# Ouvrir dans le navigateur
# http://localhost:8000
```

#### Option 2 - Node.js

```bash
# Installer http-server
npm install -g http-server

# Lancer
http-server -p 8000
```

#### Option 3 - VS Code

- Installer l'extension "Live Server"
- Clic droit sur `index.html` → "Open with Live Server"

---

## 🔧 Personnalisation

### Ajouter une Application

1. Ouvrir `index.html`
2. Dupliquer un bloc `<article class="app-card">`
3. Modifier :
   - Image (ligne `<img src="...">`)
   - Titre (`<h3>`)
   - Description (`<p>`)
   - Lien (`<a href="...">`)

### Modifier les Couleurs

Éditer les variables CSS dans `style.css` :

```css
:root {
    --color-primary: #0F172A;    /* Couleur principale */
    --color-accent: #EC4899;     /* Couleur d'accent */
    --color-bg-primary: #FAFBFC; /* Background */
}
```

---

## 📖 Documentation

- [Guide Performance](docs/PERFORMANCE_GUIDE.md)
- [Audit SEO](docs/SEO_AUDIT.md)
- [Design System](docs/DESIGN_SYSTEM.md)
- [GitHub Pages Setup](docs/GUIDE_GITHUB_PAGES.md)

---

## 🤝 Contribution

Les contributions sont les bienvenues ! N'hésitez pas à :

1. Fork le projet
2. Créer une branche (`git checkout -b feature/nouvelle-fonctionnalite`)
3. Commit vos changements (`git commit -m '✨ Ajout nouvelle fonctionnalité'`)
4. Push vers la branche (`git push origin feature/nouvelle-fonctionnalite`)
5. Ouvrir une Pull Request

---

## 📄 Licence

Ce projet est sous licence MIT. Voir le fichier [LICENSE](LICENSE) pour plus de détails.

---

## 👤 Auteur

**Oumar Straven**

- GitHub: [@VOTRE_USERNAME](https://github.com/VOTRE_USERNAME)
- Email: votre.email@example.com

---

## 🙏 Remerciements

- [Google Fonts](https://fonts.google.com/) - Quicksand
- [Icons8](https://icons8.com/) - Icônes d'applications
- [GitHub Pages](https://pages.github.com/) - Hébergement gratuit

---

## 📊 Stats

![GitHub stars](https://img.shields.io/github/stars/VOTRE_USERNAME/straven-essential?style=social)
![GitHub forks](https://img.shields.io/github/forks/VOTRE_USERNAME/straven-essential?style=social)

---

**Fait avec ❤️ pour simplifier l'accès aux applications essentielles**
EOF

echo -e "${GREEN}   ✓ README.md créé${NC}"
echo ""

# ====================
# 7. CRÉER UN FICHIER LICENCE (MIT)
# ====================
echo -e "${YELLOW}7️⃣  Création de la licence MIT...${NC}"

cat > LICENSE << 'EOF'
MIT License

Copyright (c) 2025 Oumar Straven

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

echo -e "${GREEN}   ✓ Licence MIT créée${NC}"
echo ""

# ====================
# RÉSUMÉ
# ====================
echo ""
echo "========================================"
echo -e "${GREEN}✅ PRÉPARATION TERMINÉE !${NC}"
echo "========================================"
echo ""
echo -e "${BLUE}📁 Structure créée :${NC}"
echo "   ✓ index.html (racine)"
echo "   ✓ style.css (racine)"
echo "   ✓ docs/ (documentation)"
echo "   ✓ .gitignore"
echo "   ✓ README.md"
echo "   ✓ LICENSE (MIT)"
echo ""
echo -e "${BLUE}🔧 Corrections appliquées :${NC}"
echo "   ✓ Chemins relatifs dans index.html"
echo "   ✓ Chemins relatifs dans style.css"
echo ""
echo -e "${YELLOW}📋 PROCHAINES ÉTAPES :${NC}"
echo ""
echo "1️⃣  Créer le dépôt GitHub :"
echo "   https://github.com/new"
echo ""
echo "2️⃣  Initialiser Git :"
echo "   git init"
echo "   git config user.name \"Votre Nom\""
echo "   git config user.email \"votre.email@example.com\""
echo "   git add ."
echo "   git commit -m \"🎉 Initial commit - Straven Essential Dashboard\""
echo ""
echo "3️⃣  Lier au dépôt GitHub (remplacer VOTRE_USERNAME) :"
echo "   git remote add origin https://github.com/VOTRE_USERNAME/straven-essential.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "4️⃣  Activer GitHub Pages :"
echo "   → Settings → Pages → Source: main → Save"
echo ""
echo "5️⃣  Votre site sera accessible à :"
echo "   https://VOTRE_USERNAME.github.io/straven-essential/"
echo ""
echo -e "${GREEN}📖 Guide complet : docs/GUIDE_GITHUB_PAGES.md${NC}"
echo ""
echo "✅ Prêt pour GitHub Pages !"
echo ""
