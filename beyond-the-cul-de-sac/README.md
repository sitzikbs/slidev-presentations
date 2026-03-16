# Beyond the Cul-de-Sac

**How AI and 3D Worlds are Redefining Play, Creativity, and Education**

A ~70-minute interactive talk for a non-technical audience (~60 year olds). Built with [Slidev](https://sli.dev/).

## Quick Start

```bash
npm install
npm run dev
# Open http://localhost:3030
```

## Structure

- `slides.md` — Main slide deck (~30 slides)
- `public/images/` — Generated images (use Gemini prompts from speaker notes)
- `components/` — Custom Vue components

## Before the Talk

1. Generate all images using the Gemini prompts in the HTML comments of each slide
2. Save them to `public/images/` with the filenames referenced in the slides
3. Pre-generate backup outputs for the live demos (Meshy 3D model, Suno song)
4. Prepare Lego kits and paper/pens for the workshop
5. Print QR codes for WiFi + ChatGPT caricature prompt template

## Image Files Needed

| Filename | Slide | Generate with... |
|----------|-------|-------------------|
| `hook-vangogh.jpg` | Art Quiz (left) | **Gemini** — prompt in slide 3 notes |
| `hook-monet.jpg` | Art Quiz (right) | **ChatGPT / DALL-E** — prompt in slide 3 notes |
| `story-pointcloud-vs-cad.jpg` | The Missing Shape | Gemini — slide 7 notes |
| `story-journey.jpg` | Life's Work | Gemini — slide 8 notes |
| `revolutions-fears.jpg` | Revolutions | Gemini — slide 10 notes |
| `ai-timeline.jpg` | Timeline | Gemini — slide 15 notes |
| `neuron-comparison.jpg` | Building Block | Gemini — slide 20 notes |
| `bright-future.jpg` | What's Coming | Gemini — slide 31 notes |
