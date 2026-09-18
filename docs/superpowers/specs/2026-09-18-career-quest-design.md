# Career Quest: design

**Audience:** one 7th grade CTE class (teacher flags it as his hardest class for focus). 10 to 15 min talk + 5 to 10 min Q&A.
**Goal:** plant a seed about STEM by showing where a winding path led, without ever saying "you should study STEM".
**Teacher's requested format:** intro, pathway, current career, perks, challenges.

## Decisions

- **Frame:** the career as a game map with six levels (machines, military, side quest: AI, Australia, researcher, Roblox). The zigzag makes the non-linear path the point.
- **Attention:** four guessing beats (show of hands, no devices), roughly one every 3 minutes: what is the AI character walking like, what did I study first, what is the computer looking at (3D dots that turn into a skateboarder), how many times did the experts say no.
- **"What a scientist does":** not playing games all day; building what games can't do yet. Play and talk to creators, write code, run experiments, then prove to the world's leading experts that the work is new and useful. The word "paper" is avoided.
- **Challenges:** expert rejections, 9 out of 10 ideas fail (deep understanding, exploration, persistence), starting over as the oldest beginner, moving across the world twice.
- **What to study:** one slide, framed as "power-ups I collected" rather than advice.
- **Close:** "When I was 13, my job didn't exist. Yours might not exist yet either."
- **Look:** pure black, white text, heavy type, the template's `slide-left` transitions and section-dot progress bar.
- **Delivery constraint:** presented from a school computer in a browser, so every asset is bundled; no iframes, YouTube, or CDN scripts. PDF on USB as fallback.
- **Honesty constraint:** the chicken/dinosaur/bird clips are genuinely AI-generated (StyleMotif); the 3D characters are real human motions from RoMo and are described as the examples the AI learns from.

## Build

New deck `career-quest/` from `template-deck/`, with deck-local layouts (`cover`, `updates`, `default`, `level`) overriding the theme's patterned backgrounds, and seven small Vue components (see the deck README). One unified Pages workflow builds all decks, because Pages serves a single artifact, with LFS checkout for videos.
