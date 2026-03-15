---
theme: ../theme
title: Template Preview
highlighter: shiki
class: cover
drawings:
  persist: false
transition: slide-left
mdc: true
head:
  meta:
    - name: 'og:title'
      content: 'Template Preview'
  script:
    - src: '/spa-redirect.js'
---

<div class="date-info">
2025-11-24
</div>

# Template Preview

<div class="presenter-info">
Presenter Name
<br>
<a href="https://github.com/your-username/your-slides-repo/tree/main/example-deck" target="_blank" class="text-[#38bdf8] hover:text-white text-sm font-bold transition-colors">View on GitHub</a>
</div>

<!-- 
  USAGE NOTE:
  This is the Cover Slide. 
  It automatically uses the 'cover' layout defined in theme/layouts/cover.vue.
  - Title is Left Aligned
  - Date is Top Left
  - Author is Centered Bottom
-->

---
layout: updates
---

<span class="update-date">2025-11-24</span>

# Section Title

Use this layout (`layout: updates`) to mark a new section, project milestone, or major update. It acts as a chapter divider.

<div class="presenter-info">Presenter Name</div>

<!--
  USAGE NOTE:
  - Use 'layout: updates' in the frontmatter block above.
  - The date is styled with the 'update-date' class.
  - The background is the geometric pattern.
  - Page numbers are automatically hidden.
-->

---

# Standard Content Slide

This slide uses the **default layout**. You don't need to specify `layout: default` - it's automatic.

- **Pure Black Background**: Optimized for content readability.
- **Page Numbers**: Automatically appear in the bottom-center.
- **Progress Bar**: Interactive dots at the top of the screen.

---

# Typography & Usage

This second slide demonstrates content flow.

- **Titles**: Use `h1` (#) for slide titles (auto-positioned at top).
- **Subheadings**: Use `h3` (###) for subheadings.
- **Formatting**: Use standard Markdown for lists, **bold**, and *italics*.

> "Quote blocks are also styled to match the theme."

---
layout: figure
media: https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&w=1200&q=80
caption: "Figure 1: Example visualization preserving aspect ratio"
---

# Results Visualization

Use `layout: figure` for scientific plots and data visualizations. The image maintains its aspect ratio (1:1, 4:3, etc.).

---
layout: grid-cols
media:
  - https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&w=800&q=80
  - https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&w=800&q=80
  - https://images.unsplash.com/photo-1504868584819-f8e8b4b6d7e3?auto=format&fit=crop&w=800&q=80
  - https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?auto=format&fit=crop&w=800&q=80
cols: 2
---

# Experiment Comparison

Multiple plots with explanatory text.

- Perfect for showing ablation studies
- 1:1 or 4:3 ratios preserved
- Clean grid alignment

---
layout: media-grid
cols: 3
media:
  - https://images.unsplash.com/photo-1518770660439-4636190af475?auto=format&fit=crop&w=1000&q=80
  - https://images.unsplash.com/photo-1550751827-4bd374c3f58b?auto=format&fit=crop&w=1000&q=80
  - https://images.unsplash.com/photo-1511818966892-d7d671e672a2?auto=format&fit=crop&w=1000&q=80
  - https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?auto=format&fit=crop&w=1000&q=80
  - https://images.unsplash.com/photo-1485827404703-89b55fcc595e?auto=format&fit=crop&w=1000&q=80
  - https://images.unsplash.com/photo-1504868584819-f8e8b4b6d7e3?auto=format&fit=crop&w=1000&q=80
aspect: "1/1"
caption: "Square grid (1:1 cells) for uniform figure panels"
---

# Multi-Plot Overview (Square Cells)

---
layout: figure
media: 1PaDLiQV8mubfgo-luu6gF_bTxQjYikLs
type: video
caption: "Video Visualization Example"
---

# Video Demo

---

# Code Examples

Code blocks automatically use the **VS Code Dark Plus** theme for syntax highlighting.

```python
def implementation_example():
    """
    Demonstrates python syntax highlighting.
    """
    features = ["Dark Mode", "Geometric Patterns", "Auto-Layouts"]
    
    for feature in features:
        print(f"Feature enabled: {feature}")

    return True
```

<!--
  USAGE NOTE:
  Just use standard markdown code fences (```python) to get this look.
-->

---
layout: end
---

# Thank You

Questions?

<div class="presenter-info">
Presenter Name
<br>
<a href="https://github.com/your-username/your-slides-repo/tree/main/example-deck" target="_blank" class="text-[#38bdf8] hover:text-white text-sm font-bold transition-colors">View on GitHub</a>
</div>
