#!/bin/bash

# ====================
# INITIALISATION GIT & PUSH GITHUB
# Script interactif
# ====================

echo "🚀 INITIALISATION GIT & DÉPLOIEMENT GITHUB"
echo "============================================"
echo ""

# Couleurs
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# ====================
# 1. VÉRIFIER SI GIT EST INSTALLÉ
# ====================
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Git n'est pas installé !${NC}"
    echo ""
    echo "Installation :"
    echo "  sudo apt update"
    echo "  sudo apt install git"
    exit 1
fi

echo -e "${GREEN}✓ Git est installé${NC}"
echo ""

# ====================
# 2. DEMANDER LES INFORMATIONS
# ====================
echo -e "${BLUE}📝 Configuration de votre identité Git${NC}"
echo ""

read -p "Votre nom : " USER_NAME
read -p "Votre email : " USER_EMAIL
echo ""

echo -e "${BLUE}📝 Configuration du dépôt GitHub${NC}"
echo ""

read -p "Votre nom d'utilisateur GitHub : " GITHUB_USERNAME
read -p "Nom du dépôt (défaut: straven-essential) : " REPO_NAME
REPO_NAME=${REPO_NAME:-straven-essential}

echo ""
echo -e "${YELLOW}Récapitulatif :${NC}"
echo "  Nom : $USER_NAME"
echo "  Email : $USER_EMAIL"
echo "  GitHub Username : $GITHUB_USERNAME"
echo "  Dépôt : $REPO_NAME"
echo "  URL : https://github.com/$GITHUB_USERNAME/$REPO_NAME"
echo ""

read -p "Confirmer ? (o/n) : " CONFIRM
if [ "$CONFIRM" != "o" ] && [ "$CONFIRM" != "O" ]; then
    echo "Annulé."
    exit 0
fi

echo ""

# ====================
# 3. INITIALISER GIT
# ====================
echo -e "${YELLOW}1️⃣  Initialisation de Git...${NC}"

if [ -d ".git" ]; then
    echo -e "${YELLOW}⚠  Dépôt Git déjà existant${NC}"
    read -p "Réinitialiser ? (o/n) : " REINIT
    if [ "$REINIT" = "o" ] || [ "$REINIT" = "O" ]; then
        rm -rf .git
        git init
        echo -e "${GREEN}✓ Git réinitialisé${NC}"
    fi
else
    git init
    echo -e "${GREEN}✓ Git initialisé${NC}"
fi

echo ""

# ====================
# 4. CONFIGURER L'IDENTITÉ
# ====================
echo -e "${YELLOW}2️⃣  Configuration de l'identité...${NC}"

git config user.name "$USER_NAME"
git config user.email "$USER_EMAIL"

echo -e "${GREEN}✓ Identité configurée${NC}"
echo ""

# ====================
# 5. AJOUTER LES FICHIERS
# ====================
echo -e "${YELLOW}3️⃣  Ajout des fichiers...${NC}"

git add .

# Compter les fichiers ajoutés
FILE_COUNT=$(git status --porcelain | wc -l)

echo -e "${GREEN}✓ $FILE_COUNT fichiers ajoutés${NC}"
echo ""

# ====================
# 6. PREMIER COMMIT
# ====================
echo -e "${YELLOW}4️⃣  Création du commit initial...${NC}"

git commit -m "🎉 Initial commit - Straven Essential Dashboard v2

- Dashboard centralisé pour applications essentielles
- Design System complet
- SEO optimisé (Open Graph, Schema.org)
- Performance optimisée (Critical CSS, Preload)
- Responsive & Accessible
- Documentation complète"

echo -e "${GREEN}✓ Commit créé${NC}"
echo ""

# ====================
# 7. LIER AU DÉPÔT DISTANT
# ====================
echo -e "${YELLOW}5️⃣  Liaison au dépôt GitHub...${NC}"

REPO_URL="https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"

# Vérifier si remote existe déjà
if git remote | grep -q "origin"; then
    echo -e "${YELLOW}⚠  Remote 'origin' existe déjà${NC}"
    git remote set-url origin "$REPO_URL"
    echo -e "${GREEN}✓ URL mise à jour${NC}"
else
    git remote add origin "$REPO_URL"
    echo -e "${GREEN}✓ Remote ajouté${NC}"
fi

echo ""

# ====================
# 8. RENOMMER LA BRANCHE
# ====================
echo -e "${YELLOW}6️⃣  Renommage de la branche en 'main'...${NC}"

git branch -M main

echo -e "${GREEN}✓ Branche renommée${NC}"
echo ""

# ====================
# 9. PUSH VERS GITHUB
# ====================
echo -e "${YELLOW}7️⃣  Push vers GitHub...${NC}"
echo ""
echo -e "${BLUE}⚠️  GitHub va demander vos identifiants :${NC}"
echo "  • Username : $GITHUB_USERNAME"
echo "  • Password : Utilisez un Personal Access Token (PAT)"
echo ""
echo -e "${YELLOW}Si vous n'avez pas de PAT :${NC}"
echo "  1. Aller sur https://github.com/settings/tokens"
echo "  2. Generate new token (classic)"
echo "  3. Cocher 'repo' (toute la section)"
echo "  4. Copier le token et l'utiliser comme mot de passe"
echo ""

read -p "Continuer avec le push ? (o/n) : " DO_PUSH
echo ""

if [ "$DO_PUSH" = "o" ] || [ "$DO_PUSH" = "O" ]; then
    git push -u origin main
    
    if [ $? -eq 0 ]; then
        echo ""
        echo -e "${GREEN}✅ PUSH RÉUSSI !${NC}"
        echo ""
        
        # ====================
        # 10. INSTRUCTIONS FINALES
        # ====================
        echo "╔════════════════════════════════════════════════════════════╗"
        echo "║              🎉 DÉPLOIEMENT RÉUSSI !                       ║"
        echo "╚════════════════════════════════════════════════════════════╝"
        echo ""
        echo -e "${BLUE}📋 Prochaines étapes :${NC}"
        echo ""
        echo "1. Activer GitHub Pages :"
        echo "   → https://github.com/$GITHUB_USERNAME/$REPO_NAME/settings/pages"
        echo ""
        echo "2. Configurer :"
        echo "   • Source : Branch 'main'"
        echo "   • Folder : / (root)"
        echo "   • Cliquer sur 'Save'"
        echo ""
        echo "3. Attendre 1-2 minutes"
        echo ""
        echo "4. Votre site sera accessible à :"
        echo -e "   ${GREEN}https://$GITHUB_USERNAME.github.io/$REPO_NAME/${NC}"
        echo ""
        echo "5. Tester les performances :"
        echo "   → https://pagespeed.web.dev/"
        echo ""
        echo -e "${YELLOW}📖 Guide complet : docs/GUIDE_GITHUB_PAGES.md${NC}"
        echo ""
    else
        echo ""
        echo -e "${RED}❌ Erreur lors du push${NC}"
        echo ""
        echo -e "${YELLOW}Solutions possibles :${NC}"
        echo ""
        echo "1. Le dépôt n'existe pas encore :"
        echo "   → Créer le dépôt sur https://github.com/new"
        echo "   → Nom : $REPO_NAME"
        echo "   → Public"
        echo ""
        echo "2. Problème d'authentification :"
        echo "   → Créer un Personal Access Token (PAT)"
        echo "   → https://github.com/settings/tokens"
        echo ""
        echo "3. Utiliser SSH au lieu de HTTPS :"
        echo "   git remote set-url origin git@github.com:$GITHUB_USERNAME/$REPO_NAME.git"
        echo "   git push -u origin main"
        echo ""
    fi
else
    echo ""
    echo -e "${YELLOW}Push annulé.${NC}"
    echo ""
    echo "Vous pouvez pousser manuellement avec :"
    echo "  git push -u origin main"
    echo ""
fi

echo ""
echo "✅ Script terminé !"
echo ""
