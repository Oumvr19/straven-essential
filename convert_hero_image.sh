#!/bin/bash

# ====================
# CONVERSION RAPIDE IMAGE HERO
# head_bg.png → head_bg.webp
# ====================

echo "🖼️  CONVERSION IMAGE HERO EN WEBP"
echo "===================================="
echo ""

# Vérifier si cwebp est installé
if ! command -v cwebp &> /dev/null; then
    echo "⚠️  cwebp n'est pas installé."
    echo ""
    echo "OPTION 1 - Installer cwebp (Ubuntu/Debian):"
    echo "  sudo apt update"
    echo "  sudo apt install webp"
    echo ""
    echo "OPTION 2 - Utiliser Squoosh.app (en ligne, plus facile):"
    echo "  1. Ouvrir https://squoosh.app"
    echo "  2. Uploader img/head_bg.png"
    echo "  3. Sélectionner WebP, qualité 75-80, resize 1920px"
    echo "  4. Télécharger et renommer en head_bg.webp"
    echo "  5. Placer dans img/"
    echo ""
    exit 1
fi

# Vérifier si l'image source existe
if [ ! -f "img/head_bg.png" ]; then
    echo "❌ Fichier img/head_bg.png introuvable!"
    exit 1
fi

echo "📁 Fichier source : img/head_bg.png"
ORIGINAL_SIZE=$(du -h "img/head_bg.png" | cut -f1)
echo "📊 Taille originale : $ORIGINAL_SIZE"
echo ""

echo "🔄 Conversion en cours..."
echo "   - Format: WebP"
echo "   - Qualité: 80"
echo "   - Largeur max: 1920px"
echo ""

# Conversion
cwebp -q 80 -resize 1920 0 img/head_bg.png -o img/head_bg.webp

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ CONVERSION RÉUSSIE!"
    echo ""
    NEW_SIZE=$(du -h "img/head_bg.webp" | cut -f1)
    echo "📊 Nouvelle taille : $NEW_SIZE"
    echo "📁 Fichier créé : img/head_bg.webp"
    echo ""
    
    # Calculer la réduction (approximatif)
    ORIGINAL_KB=$(du -k "img/head_bg.png" | cut -f1)
    NEW_KB=$(du -k "img/head_bg.webp" | cut -f1)
    REDUCTION=$((100 - (NEW_KB * 100 / ORIGINAL_KB)))
    
    echo "💾 Réduction : ~${REDUCTION}%"
    echo ""
    
    if [ $NEW_KB -lt 150 ]; then
        echo "🎉 EXCELLENT - Taille optimale (<150KB)"
    elif [ $NEW_KB -lt 300 ]; then
        echo "✅ BON - Taille acceptable"
    else
        echo "⚠️  La taille est encore élevée. Essayez qualité 70:"
        echo "   cwebp -q 70 -resize 1920 0 img/head_bg.png -o img/head_bg.webp"
    fi
    
    echo ""
    echo "🔄 PROCHAINES ÉTAPES:"
    echo "  1. Relancer le diagnostic: ./diagnostic_performance.sh"
    echo "  2. Tester sur PageSpeed: https://pagespeed.web.dev/"
    echo ""
else
    echo ""
    echo "❌ ERREUR lors de la conversion"
    echo ""
    echo "Alternatives:"
    echo "  - Squoosh.app: https://squoosh.app"
    echo "  - Online converter: https://convertio.co/fr/png-webp/"
    echo ""
fi
