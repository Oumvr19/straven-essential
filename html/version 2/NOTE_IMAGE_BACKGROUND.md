## ⚠️ NOTE IMPORTANTE - Image Background

**Date** : 27 octobre 2025

### Statut Actuel

L'image de background du header utilise **temporairement** le fichier PNG :
- `img/head_bg.png` (3.7MB)

### Pourquoi ?

Le fichier WebP optimisé (`img/head_bg.webp`) n'a pas encore été créé.

### Action Requise

**Convertir l'image en WebP pour améliorer les performances** :

#### Option 1 - Script automatique (si cwebp installé)
```bash
./convert_hero_image.sh
```

#### Option 2 - Squoosh.app (RECOMMANDÉ - Facile)
1. Ouvrir https://squoosh.app
2. Uploader `img/head_bg.png`
3. Paramètres :
   - Format : **WebP**
   - Qualité : **75-80**
   - Resize : Largeur max **1920px**
4. Télécharger → Renommer `head_bg.webp`
5. Placer dans `img/`

#### Option 3 - Ligne de commande
```bash
sudo apt install webp
cwebp -q 80 -resize 1920 0 img/head_bg.png -o img/head_bg.webp
```

### Après Conversion

Une fois le fichier `head_bg.webp` créé, il faudra mettre à jour :

1. **index.html** (ligne 47) :
```html
<link rel="preload" href="../../img/head_bg.webp" as="image" type="image/webp">
```

2. **style.css** (ligne 112) :
```css
background: url('../../img/head_bg.webp') center/cover no-repeat;
```

3. **Critical CSS dans index.html** (ligne 57) :
```css
background:url('../../img/head_bg.webp') center/cover no-repeat;
```

### Gain Attendu

- **Réduction de poids** : 3.7MB → <100KB (97%)
- **Gain LCP** : ~300ms
- **Score PageSpeed** : +10-15 points

---

**Fichiers actuellement configurés pour PNG** :
- ✅ `html/version 2/index.html` (preload + critical CSS)
- ✅ `html/version 2/style.css`

**L'image s'affiche correctement maintenant** avec le fichier PNG.
