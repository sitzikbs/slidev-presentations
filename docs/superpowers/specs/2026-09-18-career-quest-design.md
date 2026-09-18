# Career Quest: design

**Audience:** one 7th grade CTE class (teacher flags it as his hardest class for focus). 10 to 15 min talk + 5 to 10 min Q&A.
**Goal:** plant a seed about STEM by showing where a winding path led, without ever saying "you should study STEM".
**Teacher's requested format:** intro, pathway, current career, perks, challenges.

## Decisions

- **Frame:** the career as a game map with seven stops (machines, army, bones, 3D + AI, robots in Australia, own lab + podcast, Roblox). Each stop ends on a cliffhanger line that pulls into the next, and a small avatar walks the path, so it plays as one story rather than a list. The master's (bone micro-structures) to PhD (3D vision + AI) switch is the plot twist; the podcast is what led to Roblox.
- **Hook:** the deck opens cold on a live 3D character with no title, name, or employer on screen. "What is this person doing?" comes before "who am I".
- **Attention:** four guessing beats (show of hands, no devices), roughly one every 3 minutes: what is this 3D person doing, what did I study, what is the computer looking at (3D dots that turn into a skateboarder), how many times did the experts say no. Plus the IKEA dinosaur, used to explain "out of distribution".
- **"What a scientist does":** not playing games all day; building what games can't do yet. Play and talk to creators, write code, run experiments, then prove to the world's leading experts that the work is new and useful. The word "paper" is avoided.
- **Challenges:** expert rejections, 9 out of 10 ideas fail (deep understanding, exploration, persistence), starting over as the oldest beginner, moving across the world twice.
- **What to study:** one slide, framed as "power-ups I collected" rather than advice.
- **Close:** "When I was 13, my job didn't exist. Yours might not exist yet either. So learn the hard stuff now: if it's hard for you, it's hard for everyone, and that's your edge." (Itzik chose to make this one point explicit.)
- **Look:** pure black, white text, heavy type, the template's `slide-left` transitions and section-dot progress bar.
- **Delivery constraint:** presented from a school computer in a browser, so every asset is bundled; no iframes, YouTube, or CDN scripts. PDF on USB as fallback.
- **Honesty constraint:** the 3D characters are RoMo motions, which a computer recovered from real videos; they are described that way, and as the examples a movement-generating AI learns from. No generated motion is shown until we have it as 3D data (the pre-rendered StyleMotif videos looked poor next to live 3D and were dropped). Coding: basics in high school and two university courses, the advanced material self-taught.

## Build

New deck `career-quest/` from `template-deck/`, with deck-local layouts (`cover`, `updates`, `default`, `level`) overriding the theme's patterned backgrounds, and seven small Vue components (see the deck README). One unified Pages workflow builds all decks, because Pages serves a single artifact, with LFS checkout for videos.
