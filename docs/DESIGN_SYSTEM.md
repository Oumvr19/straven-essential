# 🎨 STRAVEN ESSENTIAL - DOCUMENTATION UI/UX V2.0

## 📊 DESIGN SYSTEM

### 🎨 **PALETTE DE COULEURS**

#### Couleurs principales
- **Primaire** : `#0F172A` (Slate 900)
  - Usage : Textes principaux, boutons primaires
  - Contraste : 15.7:1 sur blanc (AAA)

- **Accent** : `#EC4899` (Pink 500)
  - Usage : CTA, éléments interactifs, hover states
  - Contraste : 5.2:1 sur blanc (AA Large)

- **Accent Hover** : `#DB2777` (Pink 600)
  - Usage : États hover des CTA

#### Neutres
```css
--color-neutral-50: #F8FAFC   (fond secondaire)
--color-neutral-100: #F1F5F9  (fond carte hover)
--color-neutral-200: #E2E8F0  (bordures)
--color-neutral-300: #CBD5E1  (texte secondaire footer)
--color-neutral-600: #475569  (texte secondaire)
--color-neutral-700: #334155  (texte corps)
--color-neutral-900: #0F172A  (texte principal)
```

#### Surfaces
- **Fond principal** : `#FAFBFC`
- **Fond carte** : `#FFFFFF`
- **Fond footer** : `#000000`

---

### ✍️ **TYPOGRAPHIE**

#### Polices
- **Titres** : Quicksand (Google Fonts)
  - Poids : 500 (Medium), 600 (SemiBold), 700 (Bold)
  - Usage : H1, H2, H3, éléments de marque
  
- **Corps** : System Fonts Stack
  - `-apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto'`
  - Usage : Paragraphes, textes courants

#### Échelle typographique (base 16px)
```
--text-xs: 0.75rem (12px)   → Labels, badges
--text-sm: 0.875rem (14px)  → Descriptions, boutons
--text-base: 1rem (16px)    → Corps de texte
--text-lg: 1.125rem (18px)  → Sous-titres, lead
--text-xl: 1.25rem (20px)   → H3
--text-2xl: 1.5rem (24px)   → H2 mobile
--text-3xl: 2rem (32px)     → H2 desktop
--text-4xl: 2.5rem (40px)   → H1
```

#### Hiérarchie
- **H1 (Hero)** : 40px/Bold/Quicksand/-2% tracking
- **H2 (Footer)** : 32px/Bold/Quicksand/normal tracking
- **H3 (Cartes)** : 20px/SemiBold/Quicksand/normal tracking
- **Body** : 16px/Regular/System/1.6 line-height
- **Small** : 14px/Medium/System/1.5 line-height

---

### 📏 **ESPACEMENT (Base 8px)**

```css
--space-1: 0.5rem (8px)    → Petits gaps
--space-2: 1rem (16px)     → Padding boutons, gaps moyens
--space-3: 1.5rem (24px)   → Marges internes cartes
--space-4: 2rem (32px)     → Padding cartes, gaps grille
--space-6: 3rem (48px)     → Marges sections
--space-8: 4rem (64px)     → Padding footer
--space-12: 6rem (96px)    → Margin-top footer
```

**Règle** : Utiliser exclusivement ces valeurs pour maintenir un rythme vertical cohérent.

---

### 🔲 **COMPOSANTS**

#### Cartes d'application
```css
Dimensions :
  - Min-height: 320px (uniforme)
  - Padding: 2rem (32px)
  - Border-radius: 0.75rem (12px)
  - Border: 1px solid #E2E8F0

États :
  - Repos : shadow-base, border neutral-200
  - Hover : translateY(-4px), shadow-lg, border accent
  - Focus : outline 2px solid accent, offset 2px

Image :
  - Container: 100% × 140px
  - Image: 80×80px, object-fit contain
  - Filter: grayscale(40%) → 0% au hover
  - Transform: scale(1.1) au hover
```

#### Boutons CTA
```css
Primaire (cartes) :
  - Background: #0F172A
  - Hover: #EC4899
  - Padding: 1rem 2rem
  - Font-size: 0.875rem
  - Border-radius: 0.5rem

Secondaire (footer) :
  - Background: #FFFFFF
  - Hover: #EC4899 (+ color: white)
  - Padding: 1rem 2rem
  - Font-size: 0.875rem
```

#### Hero
```css
Structure :
  - Min-height: 280px
  - Background: image + scrim overlay
  - Scrim: linear-gradient(rgba(15,23,42,0.7) → 0.5)
  
Contenu :
  - Max-width: 800px
  - Padding: 3rem 2rem
  - Text-align: center
  - H1: text-shadow pour lisibilité
```

---

## 🔧 **CORRECTIONS DE BUGS**

### ✅ Bugs corrigés

1. **Textes français**
   - ❌ "dashbord" → ✅ "Dashboard"
   - ❌ "toute vos applis" → ✅ "toutes vos applications"
   - ❌ "en un seule clic" → ✅ "en un seul clic"
   - ❌ "necessaire" → ✅ "nécessaires"

2. **Variable CSS**
   - ❌ `var(--text--dark)` (double tiret)
   - ✅ Tokens redesignés : `--color-primary`, `--color-neutral-700`

3. **Icônes masquées**
   - ❌ `.card-icon { opacity: 0 }` même au hover
   - ✅ Suppression des emojis, remplacement par icônes SVG inline

4. **Images**
   - ❌ Dimensions variables, étirements
   - ✅ Container fixe 140px, images 80×80px object-fit contain

5. **Accessibilité**
   - ✅ Ajout d'attributs ARIA (`aria-label`, `aria-hidden`)
   - ✅ Textes alt descriptifs sur toutes les images
   - ✅ Focus visible (outline 2px solid accent)
   - ✅ Contraste ≥ 4.5:1 sur tous les textes

---

## 📋 **AVANT / APRÈS**

### Version 1 (Problèmes)
- ❌ Palette incohérente (violet/bleu → noir/blanc/rose)
- ❌ Cartes hauteurs variables
- ❌ Ombres trop fortes ou absentes
- ❌ Hero surchargé, contraste faible
- ❌ Icônes invisibles
- ❌ Typos FR incorrectes
- ❌ Espacement aléatoire (12px, 25px, 47px...)
- ❌ Focus outline manquant

### Version 2 (Améliorations)
- ✅ Design System complet avec tokens
- ✅ Cartes uniformes (320px min-height)
- ✅ Ombres cohérentes (système à 5 niveaux)
- ✅ Hero avec scrim, contraste ≥ 7:1
- ✅ Icônes SVG inline visibles
- ✅ Textes FR corrigés
- ✅ Espacement base 8px strict
- ✅ Accessibilité AA respectée
- ✅ Animations subtiles et performantes
- ✅ Sémantique HTML (`<article>`, `<footer>`, ARIA)

---

## 🎯 **GUIDE D'IMPLÉMENTATION**

### Étape 1 : Copier les fichiers
```bash
cp version\ 2/index.html version\ 2/style.css ./
```

### Étape 2 : Vérifier les chemins d'assets
- Images : `../../img/` (depuis version 2/)
- Icônes favicon : `../../img/icons/favicon/`
- Photo profil : `../../img/proprietaire.png`

### Étape 3 : Tester l'accessibilité
1. Navigation clavier (Tab) : tous les liens doivent avoir un focus visible
2. Contraste : utiliser WebAIM Contrast Checker
3. Screen reader : tester avec NVDA/VoiceOver

### Étape 4 : Optimisations recommandées
- Compresser `head_bg.png` (actuellement ~500KB → cible <200KB)
- Lazy loading sur images : `loading="lazy"`
- Preload de la police Quicksand
- Minifier CSS en production

---

## 📐 **COMPOSANTS RÉUTILISABLES**

### Bouton CTA
```html
<a href="#" class="app-card-link" aria-label="Description">
    <span>Texte</span>
    <svg class="icon-arrow">...</svg>
</a>
```

### Carte d'application
```html
<article class="app-card">
    <div class="app-card-image">
        <img src="..." alt="Logo descriptif">
    </div>
    <div class="app-card-content">
        <h3>Titre</h3>
        <p>Description courte</p>
    </div>
    <a href="..." class="app-card-link">Ouvrir</a>
</article>
```

---

## ✨ **CHARTE VISUELLE**

### Principes
1. **Minimalisme** : Pas de décoration superflue
2. **Cohérence** : Tokens CSS pour toutes les valeurs
3. **Accessibilité** : Contraste AA minimum, focus visible
4. **Performance** : Animations légères (transform/opacity uniquement)
5. **Responsive** : Mobile-first, breakpoints 480px / 768px

### Do's
- ✅ Utiliser les variables CSS (tokens)
- ✅ Respecter l'échelle d'espacement base 8px
- ✅ Tester au clavier
- ✅ Ajouter alt texts descriptifs
- ✅ Utiliser semantic HTML

### Don'ts
- ❌ Valeurs magiques (17px, 23px...)
- ❌ !important (sauf cas extrême)
- ❌ Animations gourmandes (width, height, top...)
- ❌ Couleurs en dur (toujours via variables)
- ❌ Textes dans les images

---

## 📱 **RESPONSIVE**

### Breakpoints
- **Mobile** : < 480px
  - Grille 1 colonne
  - H1 24px
  - Padding réduit

- **Tablette** : 480px - 768px
  - Grille 2 colonnes
  - H1 32px
  
- **Desktop** : > 768px
  - Grille 3-4 colonnes
  - H1 40px
  - Max-width 1400px

### Test checklist
- [ ] iPhone SE (375px)
- [ ] iPad (768px)
- [ ] Desktop (1440px)
- [ ] Mode paysage mobile

---

## 🚀 **MÉTRIQUES DE SUCCÈS**

- **Performance** : Lighthouse score > 90
- **Accessibilité** : WCAG AA (contraste, navigation clavier)
- **SEO** : Balises meta, semantic HTML
- **UX** : Temps de chargement < 2s, animations 60fps

---

**Version** : 2.0
**Date** : 27 octobre 2025
**Auteur** : Lead UI/UX Designer
