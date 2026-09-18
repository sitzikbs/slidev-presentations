# Career Quest

A ~14 minute career talk for a 7th grade CTE class: how a mechanical engineer ended up as a scientist at Roblox.
Black background, white text, max ~8 words per slide. The full speaking script with timing cues is in the
speaker notes of `slides.md` (press `p` in the deck for presenter view).

Live: https://sitzikbs.github.io/slidev-presentations/career-quest/

## Before the talk: things only Itzik can supply

- [ ] `public/photos/level2-military.jpg`: a military photo you're comfortable showing
- [ ] Optional: a photo of you at ~13 for the closing slide ("When I was 13, my job didn't exist")
- [ ] Optional: a higher-resolution original of the IKEA dinosaur photo (`public/photos/dinosaur-ikea.jpg` is 480px wide)
- [ ] Check the "inside of a bone" and "plot twist" speaker notes against how the master's-to-PhD switch really happened
- [x] Army slide: grey cubicle, designing and manufacturing parts ("not like the movies")
- [x] Rejections: "More than I can count"
- [x] World map: lived / flew there / teammates come from (edit the `pins` list in slides.md to add more)
- [x] Son: embarrassing-dad beat on the intro slide (his name stays off the public slide; say it out loud)
- [ ] Ask Mr. Umberger to open the live URL on the classroom computer (school filters may block `github.io`)
- [ ] Bring a PDF backup on USB: `npm run export` (needs an emoji font: `sudo apt install fonts-noto-color-emoji`)

Missing photos show as a dashed placeholder naming the expected file, so nothing breaks.

**Running long?** The tiny self-driving car slide is already hidden (`hide: true` in its frontmatter; delete that line to bring it back, +20 sec). Next candidates to hide: "More perks", then "Starting over. Three times."

## Run

```bash
npm install
npm run dev      # http://localhost:3030
npm run build    # static site in dist/
```

## Pieces

`stops.js` is the single list of the seven story stops (name, icon, place). The map and the chapter tag on every level slide both read from it.

| Component | What it does |
|---|---|
| `GuessPoll` | Four-option show-of-hands question; the answer lights up on the next click (`cols`, `compact`) |
| `LevelMap` | The seven-stop career map with place regions; `level` lights the path and a small avatar walks in from the previous stop; `compact` is the strip on level slides |
| `MotionViewer` | Animated 3D character from a `.glb`, draggable; `mode="dots"` or `reveal` (dots, then solid on click); `zoom` moves the camera closer |
| `Clip` | Looping muted video; `invert` turns white-background renders black |
| `WorldPins` | Offline world map: lived (rings), travelled (white), collaborators (blue, on click); `left`/`dy` untangle labels |
| `TenTries` | Ten idea tiles; nine flip to a miss, one to a hit |
| `PhotoSlot` | Photo with a labelled placeholder until the file exists; `invert` flips a white-background figure to black |

Everything is bundled (no iframes, no YouTube, no CDN scripts), so it works on a locked-down school computer.
Inter is bundled too (`@fontsource-variable/inter`), so the typography is identical even if the school blocks Google Fonts.

## Media credits

- 3D motions: [RoMo dataset project page](https://davidzhang73.github.io/romo-website/) (CVPR 2026). These are motions recovered from real videos, not generated ones.
- Robot clip: GoferBot (IROS 2022), from the authors' video
- Speedometer/odometer CAD animation and the tiny self-driving car (RVSS 2019): Itzik's YouTube channel
- Bone micro-structure and street point cloud: figures from Itzik's master's-era papers
- Dinosaur assembling IKEA furniture: the IKEA ASM dataset blog post
- FRC team 3316 (2011 Israel regional), which Itzik mentored as a volunteer: Itzik's YouTube channel
- Talking Papers Podcast logo; icons are [Lucide](https://lucide.dev) via `@iconify-json/lucide` (bundled at build time, no network)
