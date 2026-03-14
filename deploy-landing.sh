#!/bin/bash

# Script to deploy all slide decks and the landing page to GitHub Pages

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}Deploy All Slide Decks + Landing Page${NC}"
echo -e "${BLUE}========================================${NC}"
echo

# Get the script directory (project root)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CONFIG_FILE="${SCRIPT_DIR}/config.sh"

# Load configuration
if [ ! -f "$CONFIG_FILE" ]; then
    echo -e "${RED}Error: config.sh not found at ${CONFIG_FILE}${NC}"
    echo -e "${YELLOW}Please create config.sh with your GITHUB_HOST, GITHUB_ORG, and REPO_NAME.${NC}"
    exit 1
fi

# shellcheck source=config.sh
source "$CONFIG_FILE"

cd "$SCRIPT_DIR"

# Check if index.html exists
if [ ! -f "index.html" ]; then
    echo -e "${RED}Error: index.html not found${NC}"
    exit 1
fi

# Find and deploy all slide decks (directories with package.json containing slidev)
echo -e "${BLUE}→ Finding slide decks...${NC}"
DECKS_DEPLOYED=0

for dir in */; do
    # Skip theme, template-deck, and node_modules
    if [[ "$dir" == "theme/" ]] || [[ "$dir" == "template-deck/" ]] || [[ "$dir" == "node_modules/" ]]; then
        continue
    fi
    
    # Check if it's a slide deck (has package.json with slidev scripts)
    if [ -f "${dir}package.json" ] && grep -q '"slidev"' "${dir}package.json"; then
        DECK_NAME="${dir%/}"
        echo
        echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        echo -e "${YELLOW}Deploying: ${DECK_NAME}${NC}"
        echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
        
        cd "$SCRIPT_DIR/$DECK_NAME"
        
        # Install dependencies if node_modules doesn't exist
        if [ ! -d "node_modules" ]; then
            echo -e "${BLUE}→ Installing dependencies...${NC}"
            npm install
        fi
        
        # Build and deploy
        echo -e "${BLUE}→ Building slides...${NC}"
        npm run build
        
        echo -e "${BLUE}→ Deploying to GitHub Pages...${NC}"
        # Use --add to prevent overwriting other decks/files in the branch
        npx gh-pages -d dist -e "$DECK_NAME" --add -m "Deploy $DECK_NAME"
        
        echo -e "${GREEN}✓ ${DECK_NAME} deployed!${NC}"
        DECKS_DEPLOYED=$((DECKS_DEPLOYED + 1))
        
        cd "$SCRIPT_DIR"
    fi
done

echo
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}Deploying Landing Page${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

# Create a temporary directory for deployment
TEMP_DIR=$(mktemp -d)
echo -e "${BLUE}→ Preparing landing page...${NC}"

# Copy index.html to temp directory
cp index.html "$TEMP_DIR/"

# Create .nojekyll file (tells GitHub Pages not to use Jekyll)
touch "$TEMP_DIR/.nojekyll"

# Deploy temp directory to root of gh-pages (--add preserves existing folders)
echo -e "${BLUE}→ Deploying to GitHub Pages...${NC}"
./node_modules/.bin/gh-pages -d "$TEMP_DIR" --add -m "Update landing page"

# Clean up
rm -rf "$TEMP_DIR"

echo
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}✓ Deployment Complete!${NC}"
echo -e "${GREEN}========================================${NC}"
echo
echo -e "Decks deployed: ${YELLOW}${DECKS_DEPLOYED}${NC}"
echo
echo -e "Visit: ${BLUE}https://${GITHUB_HOST}/${GITHUB_ORG}/${REPO_NAME}/${NC}"
echo
