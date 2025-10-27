#!/bin/bash

# ====================
# DIAGNOSTIC PERFORMANCE - STRAVEN ESSENTIAL
# Script de vérification des optimisations
# ====================

echo "🚀 DIAGNOSTIC PERFORMANCE - Straven Essential"
echo "=============================================="
echo ""

# Couleurs
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Compteurs
PASSED=0
FAILED=0
WARNINGS=0

# ====================
# 1. VÉRIFICATION DES FICHIERS
# ====================
echo "📁 1. VÉRIFICATION DES FICHIERS"
echo "--------------------------------"

# Version 2 index.html
if [ -f "html/version 2/index.html" ]; then
    echo -e "${GREEN}✓${NC} index.html trouvé"
    ((PASSED++))
else
    echo -e "${RED}✗${NC} index.html MANQUANT"
    ((FAILED++))
fi

# Version 2 style.css
if [ -f "html/version 2/style.css" ]; then
    echo -e "${GREEN}✓${NC} style.css trouvé"
    ((PASSED++))
else
    echo -e "${RED}✗${NC} style.css MANQUANT"
    ((FAILED++))
fi

# .htaccess
if [ -f ".htaccess" ]; then
    echo -e "${GREEN}✓${NC} .htaccess trouvé"
    ((PASSED++))
else
    echo -e "${YELLOW}⚠${NC} .htaccess manquant (optionnel pour serveurs Apache)"
    ((WARNINGS++))
fi

echo ""

# ====================
# 2. VÉRIFICATION IMAGE HERO
# ====================
echo "🖼️  2. OPTIMISATION IMAGE HERO"
echo "--------------------------------"

# Image WebP
if [ -f "img/head_bg.webp" ]; then
    SIZE=$(du -h "img/head_bg.webp" | cut -f1)
    echo -e "${GREEN}✓${NC} head_bg.webp trouvé (${SIZE})"
    
    # Vérifier la taille
    SIZE_KB=$(du -k "img/head_bg.webp" | cut -f1)
    if [ $SIZE_KB -lt 150 ]; then
        echo -e "${GREEN}✓${NC} Taille optimale (<150KB)"
        ((PASSED++))
    else
        echo -e "${YELLOW}⚠${NC} Taille à optimiser (${SIZE_KB}KB > 150KB cible)"
        ((WARNINGS++))
    fi
else
    echo -e "${RED}✗${NC} head_bg.webp MANQUANT - Convertir head_bg.png"
    echo "   → Utiliser Squoosh.app ou cwebp"
    ((FAILED++))
fi

# Image PNG originale
if [ -f "img/head_bg.png" ]; then
    SIZE=$(du -h "img/head_bg.png" | cut -f1)
    echo -e "${YELLOW}ℹ${NC}  head_bg.png présent (${SIZE}) - Remplacer par WebP recommandé"
fi

echo ""

# ====================
# 3. VÉRIFICATION CRITICAL CSS
# ====================
echo "🎨 3. CRITICAL CSS INLINE"
echo "--------------------------------"

if grep -q "<style>" "html/version 2/index.html"; then
    echo -e "${GREEN}✓${NC} Critical CSS détecté dans <head>"
    
    # Compter les lignes de CSS critique
    LINES=$(grep -A 100 "<style>" "html/version 2/index.html" | grep -B 100 "</style>" | wc -l)
    echo "   → ${LINES} lignes de CSS critique"
    ((PASSED++))
else
    echo -e "${RED}✗${NC} Critical CSS manquant"
    ((FAILED++))
fi

echo ""

# ====================
# 4. VÉRIFICATION PRELOAD
# ====================
echo "⚡ 4. PRELOAD RESSOURCES CRITIQUES"
echo "--------------------------------"

# Preload image hero
if grep -q 'rel="preload".*head_bg.webp' "html/version 2/index.html"; then
    echo -e "${GREEN}✓${NC} Preload image hero configuré"
    ((PASSED++))
else
    echo -e "${YELLOW}⚠${NC} Preload image hero manquant ou incorrect"
    ((WARNINGS++))
fi

# Preload CSS
if grep -q 'rel="preload".*style.css' "html/version 2/index.html"; then
    echo -e "${GREEN}✓${NC} Preload style.css configuré"
    ((PASSED++))
else
    echo -e "${YELLOW}⚠${NC} Preload style.css manquant"
    ((WARNINGS++))
fi

echo ""

# ====================
# 5. VÉRIFICATION FONTS
# ====================
echo "🔤 5. OPTIMISATION FONTS"
echo "--------------------------------"

# Font-display swap
if grep -q 'display=swap' "html/version 2/index.html"; then
    echo -e "${GREEN}✓${NC} font-display:swap activé"
    ((PASSED++))
else
    echo -e "${RED}✗${NC} font-display:swap MANQUANT"
    ((FAILED++))
fi

# Fonts locales (optionnel)
if [ -d "html/version 2/fonts" ]; then
    COUNT=$(ls "html/version 2/fonts"/*.woff2 2>/dev/null | wc -l)
    if [ $COUNT -gt 0 ]; then
        echo -e "${GREEN}✓${NC} Fonts locales trouvées (${COUNT} fichiers)"
        ((PASSED++))
    fi
else
    echo -e "${YELLOW}ℹ${NC}  Fonts Google CDN utilisées (optionnel: héberger localement pour -200ms LCP)"
fi

echo ""

# ====================
# 6. VÉRIFICATION IMAGES LAZY-LOAD
# ====================
echo "🖼️  6. LAZY-LOADING IMAGES"
echo "--------------------------------"

LAZY_COUNT=$(grep -c 'loading="lazy"' "html/version 2/index.html" 2>/dev/null || echo "0")
if [ $LAZY_COUNT -gt 0 ]; then
    echo -e "${GREEN}✓${NC} ${LAZY_COUNT} images en lazy-load"
    ((PASSED++))
else
    echo -e "${YELLOW}⚠${NC} Aucune image en lazy-load trouvée"
    ((WARNINGS++))
fi

echo ""

# ====================
# 7. VÉRIFICATION WIDTH/HEIGHT IMAGES
# ====================
echo "📐 7. DIMENSIONS IMAGES (anti-CLS)"
echo "--------------------------------"

IMG_COUNT=$(grep -c '<img' "html/version 2/index.html" 2>/dev/null || echo "0")
IMG_WITH_DIMS=$(grep -c '<img.*width=.*height=' "html/version 2/index.html" 2>/dev/null || echo "0")

if [ $IMG_COUNT -eq $IMG_WITH_DIMS ]; then
    echo -e "${GREEN}✓${NC} Toutes les images ont width/height (${IMG_COUNT}/${IMG_COUNT})"
    ((PASSED++))
else
    echo -e "${YELLOW}⚠${NC} ${IMG_WITH_DIMS}/${IMG_COUNT} images ont width/height"
    ((WARNINGS++))
fi

echo ""

# ====================
# 8. VÉRIFICATION GRAYSCALE FILTERS
# ====================
echo "🎨 8. FILTRES CSS (Performance GPU)"
echo "--------------------------------"

GRAYSCALE_COUNT=$(grep -c 'grayscale' "html/version 2/style.css" 2>/dev/null || echo "0")
if [ $GRAYSCALE_COUNT -eq 0 ]; then
    echo -e "${GREEN}✓${NC} Pas de filtres grayscale (optimisé)"
    ((PASSED++))
else
    echo -e "${YELLOW}⚠${NC} ${GRAYSCALE_COUNT} filtres grayscale trouvés (impact INP)"
    ((WARNINGS++))
fi

echo ""

# ====================
# 9. VÉRIFICATION SEO
# ====================
echo "🔍 9. SEO META TAGS"
echo "--------------------------------"

# Open Graph
OG_COUNT=$(grep -c 'og:' "html/version 2/index.html" 2>/dev/null || echo "0")
if [ $OG_COUNT -ge 5 ]; then
    echo -e "${GREEN}✓${NC} Open Graph configuré (${OG_COUNT} tags)"
    ((PASSED++))
else
    echo -e "${YELLOW}⚠${NC} Open Graph incomplet (${OG_COUNT} tags)"
    ((WARNINGS++))
fi

# JSON-LD
if grep -q 'application/ld+json' "html/version 2/index.html"; then
    echo -e "${GREEN}✓${NC} JSON-LD Schema.org présent"
    ((PASSED++))
else
    echo -e "${YELLOW}⚠${NC} JSON-LD manquant"
    ((WARNINGS++))
fi

# Sitemap
if [ -f "sitemap.xml" ]; then
    echo -e "${GREEN}✓${NC} sitemap.xml trouvé"
    ((PASSED++))
else
    echo -e "${YELLOW}⚠${NC} sitemap.xml manquant"
    ((WARNINGS++))
fi

# Robots.txt
if [ -f "robots.txt" ]; then
    echo -e "${GREEN}✓${NC} robots.txt trouvé"
    ((PASSED++))
else
    echo -e "${YELLOW}⚠${NC} robots.txt manquant"
    ((WARNINGS++))
fi

echo ""

# ====================
# 10. VÉRIFICATION COMPRESSION
# ====================
echo "🗜️  10. COMPRESSION & CACHE"
echo "--------------------------------"

if [ -f ".htaccess" ]; then
    if grep -q 'mod_deflate' ".htaccess"; then
        echo -e "${GREEN}✓${NC} Compression Gzip configurée"
        ((PASSED++))
    fi
    
    if grep -q 'mod_brotli' ".htaccess"; then
        echo -e "${GREEN}✓${NC} Compression Brotli configurée"
        ((PASSED++))
    fi
    
    if grep -q 'mod_expires' ".htaccess"; then
        echo -e "${GREEN}✓${NC} Cache-Control configuré"
        ((PASSED++))
    fi
else
    echo -e "${YELLOW}ℹ${NC}  .htaccess absent - Compression/cache non vérifiable"
fi

echo ""
echo ""

# ====================
# RÉSUMÉ
# ====================
echo "======================================"
echo "📊 RÉSUMÉ DU DIAGNOSTIC"
echo "======================================"
echo -e "${GREEN}✓ Réussi:${NC}      $PASSED"
echo -e "${YELLOW}⚠ Avertissements:${NC} $WARNINGS"
echo -e "${RED}✗ Échecs:${NC}      $FAILED"
echo ""

TOTAL=$((PASSED + WARNINGS + FAILED))
SCORE=$((PASSED * 100 / TOTAL))

if [ $SCORE -ge 90 ]; then
    echo -e "${GREEN}🎉 EXCELLENT${NC} - Score: ${SCORE}%"
elif [ $SCORE -ge 70 ]; then
    echo -e "${YELLOW}✅ BON${NC} - Score: ${SCORE}%"
else
    echo -e "${RED}⚠️  À AMÉLIORER${NC} - Score: ${SCORE}%"
fi

echo ""
echo "📋 ACTIONS RECOMMANDÉES:"
echo "------------------------"

if [ ! -f "img/head_bg.webp" ]; then
    echo "1. 🔴 PRIORITÉ - Convertir head_bg.png en WebP"
    echo "   → https://squoosh.app (qualité 75-80, max 1920px)"
fi

if [ $LAZY_COUNT -eq 0 ]; then
    echo "2. 🟡 Ajouter loading=\"lazy\" sur les images non-critiques"
fi

if [ $GRAYSCALE_COUNT -gt 0 ]; then
    echo "3. 🟡 Supprimer les filtres grayscale pour améliorer INP"
fi

if [ ! -d "html/version 2/fonts" ]; then
    echo "4. 🟢 OPTIONNEL - Héberger fonts localement (-200ms LCP)"
fi

echo ""
echo "🧪 TESTER LES PERFORMANCES:"
echo "---------------------------"
echo "• PageSpeed Insights: https://pagespeed.web.dev/"
echo "• WebPageTest:        https://webpagetest.org/"
echo "• Chrome DevTools:    F12 → Lighthouse"
echo ""

echo "✅ Diagnostic terminé!"
echo ""
