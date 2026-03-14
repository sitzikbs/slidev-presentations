# Slidev Deck Template

A ready-to-use template for building multiple [Slidev](https://sli.dev) presentation decks from a single repository, with a custom dark theme, GitHub Pages deployment, and a deck scaffolding script.

## Repository Structure

```
slidev-deck-template/
├── theme/                 # Custom dark theme (shared by all decks)
│   ├── package.json
│   ├── index.ts
│   ├── layouts/           # cover, updates, default, figure, grid-cols, media-cols, media-grid, end
│   ├── components/        # DriveMedia.vue (Google Drive embeds)
│   ├── styles/
│   │   └── layout.css     # Design system (colors, typography, spacing)
│   ├── global-top.vue     # Progress bar (section dots)
│   └── global-bottom.vue  # Page number (auto-hidden on cover/updates)
├── template-deck/         # Source template — DO NOT use directly
├── example-deck/          # Live demo of all layouts (deploy as-is)
├── config.sh              # One-time setup: your GitHub org, repo name, presenter name
├── create-deck.sh         # Scaffold a new deck from the template
├── deploy-landing.sh      # Build + deploy all decks and the landing page
├── index.html             # Landing page listing all decks
├── 404.html               # Root SPA redirect for GitHub Pages deep links
└── package.json           # Root package (gh-pages for deployment)
```

## Setup (One Time)

### 1. Configure your details

Edit `config.sh` with your GitHub information:

```bash
GITHUB_HOST="github.com"          # Use your enterprise host if applicable
GITHUB_ORG="your-username"        # GitHub username or organization
REPO_NAME="your-slides-repo"      # Repository name as it appears on GitHub
PRESENTER_NAME="Your Name"        # Name shown on title and end slides
```

### 2. Install root dependencies

```bash
npm install
```

This installs `gh-pages` used by `deploy-landing.sh`.

### 3. Push to GitHub and enable GitHub Pages

In your repository settings, enable GitHub Pages from the `gh-pages` branch (root `/`).

---

## Creating a New Deck

```bash
./create-deck.sh
```

The script will:
1. Prompt for a deck name (e.g. `my-talk`)
2. Copy `template-deck/` to `my-talk/`
3. Replace all placeholders with values from `config.sh` and the current date
4. Run `npm install` in the new deck
5. Print next steps

---

## Working with a Deck

### Development

```bash
cd my-talk
npm run dev
# Open http://localhost:3030
```

### Build

```bash
cd my-talk
npm run build
# Output in my-talk/dist/
```

### Deploy a single deck

```bash
cd my-talk
npm run deploy
# Deploys to: https://<GITHUB_HOST>/<GITHUB_ORG>/<REPO_NAME>/my-talk/
```

### Deploy everything (all decks + landing page)

```bash
./deploy-landing.sh
```

After deploying a new deck, add its card to `index.html` (see the comment block inside the file for the HTML snippet), then run `./deploy-landing.sh` again.

---

## Editing Slides

Open `slides.md` in your deck directory. The template includes:

- **Cover slide** — title, date, presenter, GitHub link
- **Updates slide** — `layout: updates` for section dividers / changelogs
- **Content slides** — standard default layout with auto logo, page number, progress bar
- **Figure slide** — `layout: figure` with caption; supports local paths and Google Drive IDs
- **Grid layouts** — `layout: grid-cols` and `layout: media-grid` for multi-image panels
- **Code slide** — syntax highlighting via Shiki (VS Code Dark Plus theme)
- **End slide** — `layout: end` for thank-you / Q&A

### Importing sections

For large decks, split slides into separate files and import them:

```markdown
---
src: ./sections/2025-01-01-intro.md
---
```

### Adding an Updates entry

```markdown
<div class="update-item">
  <div class="update-date">2025-06-01</div>
  <div class="update-description">Added results from experiment 2</div>
</div>
```

### Embedding Google Drive media

Use the `DriveMedia` component or the `media:` frontmatter field with a Drive file ID:

```markdown
---
layout: figure
media: 1PaDLiQV8mubfgo-luu6gF_bTxQjYikLs
type: video
caption: "Demo video"
---
```

---

## Custom Theme

The theme lives in `theme/` and is shared by all decks (`theme: ../theme` in each `slides.md`).

### Design system

| Token | Value |
|---|---|
| Background | `#0a0a0a` |
| Primary text | `#ffffff` |
| Secondary text | `#e0e0e0` |
| Link color | `#60a5fa` |
| Font | Inter (Google Fonts) |
| Code theme | Shiki `dark-plus` |

### Modifying the theme

Edit `theme/styles/layout.css` to change colors, typography, or spacing globally across all decks.

### Available layouts

| Layout | Description |
|---|---|
| *(none / default)* | Standard content slide |
| `cover` | Title slide with date and presenter |
| `updates` | Section divider / changelog |
| `figure` | Full-width image or video with caption |
| `grid-cols` | Multi-column image grid with text |
| `media-cols` | Content column + media column |
| `media-grid` | Pure media grid (no text) |
| `end` | Thank-you / Q&A slide |

---

## GitHub Pages Deployment Details

Each deck is built with `--base /<org>/<repo>/<deck-name>/` so all asset paths resolve correctly on GitHub Pages.

The SPA routing works as follows:

1. **Root `404.html`** — Captures the full URL and redirects to the deck's base path.
2. **`vite.config.js`** (in each deck) — Injects an inline script into the built HTML that restores the original URL from `sessionStorage`, allowing direct slide links to work.

This enables URLs like `https://username.github.io/repo/my-talk/5` to load the correct slide directly.

---

## Troubleshooting

### Dependency issues

```bash
cd my-talk
rm -rf node_modules package-lock.json
npm install
```

### Stale build cache

```bash
cd my-talk
rm -rf .slidev
npm run build
```

### Theme not loading

Ensure the theme path in `slides.md` points to the repo root:

```yaml
---
theme: ../theme
---
```

---

## Keyboard Shortcuts

| Key | Action |
|---|---|
| `Space` / `→` | Next slide |
| `←` | Previous slide |
| `P` | Presenter mode |
| `O` | Slides overview |
| `F` | Fullscreen |
| `D` | Dark mode toggle |

---

## Resources

- [Slidev Documentation](https://sli.dev)
- [Slidev Theme Gallery](https://sli.dev/themes/gallery)
- [Markdown Guide](https://www.markdownguide.org/)
- [Vue.js](https://vuejs.org/) for custom components
