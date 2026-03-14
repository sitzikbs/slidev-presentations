#!/bin/bash

# Script to create a new Slidev deck from the template

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}Slidev Deck Creation Script${NC}"
echo -e "${BLUE}================================${NC}"
echo

# Get the script directory (project root)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TEMPLATE_DIR="${SCRIPT_DIR}/template-deck"
CONFIG_FILE="${SCRIPT_DIR}/config.sh"

# Load configuration
if [ ! -f "$CONFIG_FILE" ]; then
    echo -e "${RED}Error: config.sh not found at ${CONFIG_FILE}${NC}"
    echo -e "${YELLOW}Please create config.sh with your GITHUB_HOST, GITHUB_ORG, REPO_NAME, and PRESENTER_NAME.${NC}"
    exit 1
fi

# shellcheck source=config.sh
source "$CONFIG_FILE"

# Validate required config values
if [ "$GITHUB_ORG" = "your-username" ] || [ "$REPO_NAME" = "your-slides-repo" ] || [ "$PRESENTER_NAME" = "Your Name" ]; then
    echo -e "${YELLOW}Warning: config.sh still contains placeholder values.${NC}"
    echo -e "${YELLOW}Please edit config.sh before creating decks for accurate URLs and presenter info.${NC}"
    echo
fi

# Derive the base path used in GitHub Pages URLs: GITHUB_ORG/REPO_NAME
REPO_BASE="${GITHUB_ORG}/${REPO_NAME}"

# Check if template exists
if [ ! -d "$TEMPLATE_DIR" ]; then
    echo -e "${RED}Error: Template directory not found at ${TEMPLATE_DIR}${NC}"
    exit 1
fi

# Prompt for deck name
echo -e "${YELLOW}Enter the name for your new deck (e.g., 'my-presentation'):${NC}"
read -r DECK_NAME

# Validate deck name
if [ -z "$DECK_NAME" ]; then
    echo -e "${RED}Error: Deck name cannot be empty${NC}"
    exit 1
fi

# Remove any spaces and special characters, convert to lowercase with hyphens
DECK_NAME=$(echo "$DECK_NAME" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9-]/-/g' | sed 's/--*/-/g' | sed 's/^-//' | sed 's/-$//')

if [ -z "$DECK_NAME" ]; then
    echo -e "${RED}Error: Invalid deck name${NC}"
    exit 1
fi

NEW_DECK_DIR="${SCRIPT_DIR}/${DECK_NAME}"

# Check if deck already exists
if [ -d "$NEW_DECK_DIR" ]; then
    echo -e "${RED}Error: Deck '${DECK_NAME}' already exists${NC}"
    exit 1
fi

echo
echo -e "${GREEN}Creating new deck: ${DECK_NAME}${NC}"
echo

# Copy template to new deck
echo -e "${BLUE}→ Copying template files...${NC}"
cp -r "$TEMPLATE_DIR" "$NEW_DECK_DIR"

# Get current date
CURRENT_DATE=$(date +%Y-%m-%d)

# Update package.json: replace deck name and repo base path
echo -e "${BLUE}→ Updating package.json...${NC}"
sed -i.bak "s/DECK_NAME_PLACEHOLDER/${DECK_NAME}/g" "${NEW_DECK_DIR}/package.json"
sed -i.bak "s|REPO_BASE_PLACEHOLDER|${REPO_BASE}|g" "${NEW_DECK_DIR}/package.json"
rm "${NEW_DECK_DIR}/package.json.bak"

# Update public/404.html: replace deck name and repo base path
echo -e "${BLUE}→ Updating public/404.html...${NC}"
sed -i.bak "s/DECK_NAME_PLACEHOLDER/${DECK_NAME}/g" "${NEW_DECK_DIR}/public/404.html"
sed -i.bak "s|REPO_BASE_PLACEHOLDER|${REPO_BASE}|g" "${NEW_DECK_DIR}/public/404.html"
rm "${NEW_DECK_DIR}/public/404.html.bak"

# Update slides.md: replace creation date, presenter name, and repo URL
echo -e "${BLUE}→ Updating slides.md...${NC}"
REPO_URL="https://${GITHUB_HOST}/${GITHUB_ORG}/${REPO_NAME}/tree/main/${DECK_NAME}"
sed -i.bak "s/CREATION_DATE_PLACEHOLDER/${CURRENT_DATE}/g" "${NEW_DECK_DIR}/slides.md"
sed -i.bak "s|REPO_URL_PLACEHOLDER|${REPO_URL}|g" "${NEW_DECK_DIR}/slides.md"
sed -i.bak "s/PRESENTER_NAME_PLACEHOLDER/${PRESENTER_NAME}/g" "${NEW_DECK_DIR}/slides.md"
rm "${NEW_DECK_DIR}/slides.md.bak"

# Install dependencies
echo -e "${BLUE}→ Installing dependencies...${NC}"
cd "$NEW_DECK_DIR"
npm install

echo
echo -e "${GREEN}✓ Deck created successfully!${NC}"
echo
echo -e "${BLUE}================================${NC}"
echo -e "${BLUE}Next Steps:${NC}"
echo -e "${BLUE}================================${NC}"
echo
echo -e "1. Navigate to your new deck:"
echo -e "   ${YELLOW}cd ${DECK_NAME}${NC}"
echo
echo -e "2. Start the development server:"
echo -e "   ${YELLOW}npm run dev${NC}"
echo
echo -e "3. Edit your slides:"
echo -e "   ${YELLOW}Open ${DECK_NAME}/slides.md in your editor${NC}"
echo
echo -e "4. Build for production:"
echo -e "   ${YELLOW}npm run build${NC}"
echo
echo -e "5. Deploy to GitHub Pages:"
echo -e "   ${YELLOW}npm run deploy${NC}"
echo
echo -e "6. Update index.html to add a card for your new deck, then:"
echo -e "   ${YELLOW}./deploy-landing.sh${NC}"
echo
echo -e "${GREEN}Happy presenting!${NC}"
echo
