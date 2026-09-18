# Career Quest

A 13 to 15 minute career talk for a 7th grade CTE class: how a mechanical engineer ended up as a scientist at Roblox.
Black background, white text, max ~8 words per slide. The full speaking script with timing cues is in the
speaker notes of `slides.md` (press `p` in the deck for presenter view).

Live: https://sitzikbs.github.io/slidev-presentations/career-quest/

## Before the talk: things only Itzik can supply

- [ ] `public/photos/level1-machines.jpg`: you as a student, or something you built
- [ ] `public/photos/level2-military.jpg`: a military photo you're comfortable showing
- [ ] Optional: a photo of you at ~13 for the closing slide ("When I was 13, my job didn't exist")
- [x] Army slide: grey cubicle, designing and manufacturing parts ("not like the movies")
- [x] Rejections: "More than I can count"
- [x] World map: lived / flew there / teammates come from (edit the `pins` list in slides.md to add more)
- [x] Son: embarrassing-dad beat on the intro slide (his name stays off the public slide; say it out loud)
- [ ] Ask Mr. Umberger to open the live URL on the classroom computer (school filters may block `github.io`)
- [ ] Bring a PDF backup on USB: `npm run export` (needs an emoji font: `sudo apt install fonts-noto-color-emoji`)

Missing photos show as a dashed placeholder naming the expected file, so nothing breaks.

## Run

```bash
npm install
npm run dev      # http://localhost:3030
npm run build    # static site in dist/
```

## Pieces

| Component | What it does |
|---|---|
| `GuessPoll` | Four-option show-of-hands question; the answer lights up on the next click |
| `LevelMap` | The winding career map; `level` lights the path, `compact` is the strip on level slides |
| `MotionViewer` | Animated 3D character from a `.glb`, draggable; `mode="dots"` or `reveal` (dots, then solid on click) |
| `Clip` | Looping muted video; `invert` turns white-background renders black |
| `WorldPins` | Offline world map with pop-in pins |
| `TenTries` | Ten idea tiles; nine flip to a miss, one to a hit |
| `PhotoSlot` | Photo with a labelled placeholder until the file exists |

Everything is bundled (no iframes, no YouTube, no CDN scripts), so it works on a locked-down school computer.
The only network request is the theme's Inter web font, which falls back to a system font.

## Media credits

- 3D motions: [RoMo dataset project page](https://davidzhang73.github.io/romo-website/) (CVPR 2026)
- "Walk like a chicken / dinosaur / bird": [StyleMotif](https://stylemotif.github.io/) results
- Robot clip: GoferBot (IROS 2022), from the authors' video
