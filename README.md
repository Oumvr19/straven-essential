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
