# COMMANDES GITHUB - COPIER-COLLER
# Straven Essential Dashboard

# ═══════════════════════════════════════════════════════════════════
# ÉTAPE 1 : CRÉER LE DÉPÔT SUR GITHUB
# ═══════════════════════════════════════════════════════════════════

# Ouvrir dans le navigateur :
https://github.com/new

# Paramètres :
#   - Repository name: straven-essential
#   - Description: Dashboard centralisé pour applications essentielles
#   - Public ✓
#   - Ne rien ajouter (README, .gitignore, licence)
# 
# Cliquer "Create repository"


# ═══════════════════════════════════════════════════════════════════
# ÉTAPE 2 : COMMANDES GIT (COPIER-COLLER DANS LE TERMINAL)
# ═══════════════════════════════════════════════════════════════════

# Se placer dans le dossier du projet
cd "/home/oumvr667/Bureau/university/application web/projet/straven oumar essentiel"

# Initialiser Git
git init

# Configurer votre identité (MODIFIER AVEC VOS INFOS)
git config user.name "Oumar Straven"
git config user.email "votre.email@example.com"

# Ajouter tous les fichiers
git add .

# Premier commit
git commit -m "🎉 Initial commit - Straven Essential Dashboard v2"

# Lier au dépôt GitHub (REMPLACER VOTRE_USERNAME)
git remote add origin https://github.com/VOTRE_USERNAME/straven-essential.git

# Renommer la branche en main
git branch -M main

# Pousser vers GitHub
git push -u origin main


# ═══════════════════════════════════════════════════════════════════
# ÉTAPE 3 : CRÉER UN PERSONAL ACCESS TOKEN (SI NÉCESSAIRE)
# ═══════════════════════════════════════════════════════════════════

# Si GitHub demande un mot de passe :
# 1. Ouvrir : https://github.com/settings/tokens
# 2. Cliquer "Generate new token" → "Generate new token (classic)"
# 3. Note: "Straven Essential Deployment"
# 4. Expiration: 90 days (ou plus)
# 5. Cocher "repo" (toute la section)
# 6. Générer le token
# 7. COPIER LE TOKEN (vous ne pourrez plus le voir !)
# 8. Utiliser comme mot de passe lors du git push


# ═══════════════════════════════════════════════════════════════════
# ÉTAPE 4 : ACTIVER GITHUB PAGES
# ═══════════════════════════════════════════════════════════════════

# Ouvrir dans le navigateur (REMPLACER VOTRE_USERNAME) :
https://github.com/VOTRE_USERNAME/straven-essential/settings/pages

# Configuration :
#   - Source: Deploy from a branch
#   - Branch: main
#   - Folder: / (root)
#   - Cliquer "Save"
#
# Attendre 1-2 minutes


# ═══════════════════════════════════════════════════════════════════
# ÉTAPE 5 : VISITER VOTRE SITE
# ═══════════════════════════════════════════════════════════════════

# Votre site sera accessible à (REMPLACER VOTRE_USERNAME) :
https://VOTRE_USERNAME.github.io/straven-essential/


# ═══════════════════════════════════════════════════════════════════
# MISES À JOUR FUTURES
# ═══════════════════════════════════════════════════════════════════

# Après avoir modifié des fichiers :

git status                                    # Voir les fichiers modifiés
git add .                                     # Ajouter les modifications
git commit -m "✨ Description modifications"  # Créer un commit
git push                                      # Pousser vers GitHub

# Le site se met à jour automatiquement en 1-2 minutes


# ═══════════════════════════════════════════════════════════════════
# ALTERNATIVE : SCRIPT AUTOMATIQUE
# ═══════════════════════════════════════════════════════════════════

# Au lieu de tout taper manuellement, utilisez :
./deploy_to_github.sh

# Le script vous guidera interactivement


# ═══════════════════════════════════════════════════════════════════
# TESTER LES PERFORMANCES
# ═══════════════════════════════════════════════════════════════════

# PageSpeed Insights :
https://pagespeed.web.dev/

# Coller votre URL GitHub Pages et analyser


# ═══════════════════════════════════════════════════════════════════
# PROBLÈMES COURANTS
# ═══════════════════════════════════════════════════════════════════

# ❌ "remote: Repository not found"
# → Le dépôt n'existe pas encore sur GitHub
# → Créer le dépôt d'abord : https://github.com/new

# ❌ "Page not found" (404)
# → Vérifier que GitHub Pages est activé
# → Attendre 2-3 minutes
# → Vider le cache (Ctrl+F5)

# ❌ Git demande le mot de passe en boucle
# → Créer un Personal Access Token
# → https://github.com/settings/tokens

# ❌ Permission denied (publickey) avec SSH
# → Configurer SSH : https://docs.github.com/authentication/connecting-to-github-with-ssh
# → Ou utiliser HTTPS à la place
