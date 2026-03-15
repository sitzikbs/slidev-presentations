# Slidev Theme - Dark Geometric

A custom Slidev theme with a dark background and geometric patterns.

## Features

- **Dark Mode**: Optimized for dark backgrounds (#0a0a0a) with white text.
- **Layouts**:
  - `cover`: Geometric background, left-aligned title, centered author.
  - `default`: Pure black background, top progress dots.
  - `content`: Same as default (alias).
  - `updates`: Section divider with geometric background for changelogs/milestones.
  - `figure`: Title + Media (image/video) + Caption. Preserves aspect ratio (1:1, 4:3, etc.).
  - `media-cols`: Split layout (text + media) with adjustable position.
  - `media-grid`: Full-width grid of media items (2+ columns, optional 1:1 square cells).
  - `grid-cols`: Text on left + Grid of media on right (for comparisons with context).
  - `end`: Closing slide with geometric background.
- **Components**:
  - **DriveMedia**: Smart component to embed Google Drive images/videos or direct URLs.
  - **Top Progress Bar**: Connected dots navigation at the top of every slide.
  - **Page Numbers**: Auto-displayed at bottom center (hidden on cover/updates).
- **Typography**: Uses Inter font, large legible text.
- **Code Highlighting**: Uses `dark-plus` (VS Code) theme.

## Usage

In your `slides.md` frontmatter:

```yaml
---
theme: ./theme
---
```

### Updates Layout

Use this layout to mark a new section or milestone:

```markdown
---
layout: updates
---

<span class="update-date">2025-11-24</span>

# Milestone Name

Description of the update.
<div class="presenter-info">Author Name</div>
```

### Media Layouts

**Figure Layout (Scientific Plots):**
```markdown
---
layout: figure
media: GOOGLE_DRIVE_FILE_ID (or URL or /local/path.png)
caption: "Figure 1: Description"
---

# Results

Text describing the figure.
```

**Split Media (Text + Image):**
```markdown
---
layout: media-cols
media: GOOGLE_DRIVE_FILE_ID
position: right
---
# Title
Text content...
```

**Grid with Text (Comparison):**
```markdown
---
layout: grid-cols
media:
  - ID_1
  - ID_2
  - ID_3
  - ID_4
cols: 2
---
# Experiment Results

Explanatory text for the plots.
```

**Media Grid (Full-width):**
```markdown
---
layout: media-grid
cols: 3
aspect: "1/1"
media:
  - ID_1
  - ID_2
  - ID_3
  - ID_4
  - ID_5
  - ID_6
caption: "Grid Caption"
---

# Multi-Plot Overview
```

### Content Slides

Standard slides use the default layout automatically:

```markdown
---

# Slide Title

Content goes here...
```

## Customization

- Edit `theme/styles/layout.css` for global styles.
- Edit `theme/layouts/*.vue` for layout structure.
- Edit `theme/global-top.vue` for the progress bar.
