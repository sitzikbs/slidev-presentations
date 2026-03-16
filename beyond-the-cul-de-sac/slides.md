---
theme: ../theme
title: "Beyond the Cul-de-Sac"
highlighter: shiki
class: cover
drawings:
  persist: false
transition: slide-left
mdc: true
head:
  meta:
    - name: 'og:title'
      content: 'Beyond the Cul-de-Sac: How AI and 3D Worlds are Redefining Play, Creativity, and Education'
  script:
    - src: '/spa-redirect.js'
---

# Beyond the Cul-de-Sac

<div style="margin-top: 1.2rem; font-size: 1.45rem; color: #ccc; font-weight: 400; line-height: 1.5;">
How AI and 3D Worlds are Redefining Play, Creativity, and Education
</div>

<div class="presenter-info">
Itzik (Yizhak) Ben-Shabat
<br>
Senior Scientist, Roblox
<br>
<img src="/images/Itzik_ben_shabat_protrait.jpg" style="width: 112px; height: 112px; border-radius: 50%; object-fit: cover; margin-top: 1rem; display: block; margin-left: auto; margin-right: auto;" />
</div>

<div class="cover-date">2026</div>

<style>
.slidev-layout.cover h1 {
  text-transform: uppercase;
  font-size: 3.2rem;
  font-weight: 800;
  letter-spacing: 0.02em;
  white-space: nowrap;
}
.cover-date {
  position: absolute;
  bottom: 2rem;
  right: 3rem;
  font-size: 0.85rem;
  color: rgba(255,255,255,0.35);
  font-weight: 300;
}
</style>

<!--
Speaker notes:
Welcome everyone. Today we're going on an adventure together.
By the end of this session, you will have created something with AI — with your own hands.
-->

---
layout: updates
---

# 🎨 Guess the Artist

<p style="font-size: 1.8rem; color: #ccc;">
I'm going to show you some beautiful artwork.<br>
Your job: <strong style="color: #38bdf8;">name the artist</strong>.
</p>

<!--
SECTION 1: HOOK — "Guess the Artist" (3 min)
Interactive quiz. Show AI-generated artwork in famous styles. Audience guesses.
The reveal: the artist is AI. But YOU gave the direction.
-->

---

<h1 style="text-align: center; margin-bottom: 0.5rem;">🎨 Who Are the Artists?</h1>

<div style="display: flex; justify-content: center; gap: 3rem; align-items: flex-start; margin-top: 1rem; height: 72%;">
  <div style="text-align: center; flex: 1; max-width: 42%;">
    <img :src="'/images/van_gogh_gemini.png'" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 20px rgba(0,0,0,0.5);" />
    <p style="font-size: 2rem; margin-top: 0.8rem; color: #38bdf8; font-weight: 700;">?</p>
  </div>
  <div style="text-align: center; flex: 1; max-width: 42%;">
    <img :src="'/images/Monet_chatGPT.png'" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 20px rgba(0,0,0,0.5);" />
    <p style="font-size: 2rem; margin-top: 0.8rem; color: #38bdf8; font-weight: 700;">?</p>
  </div>
</div>

<!--
🎨 IMAGE 1 (left) — Generate with GEMINI (Imagen):
"An oil painting of a busy open-air street market in Jaffa, Israel, with colorful fruit stalls
and a glimpse of the Mediterranean Sea in the background, painted in the style of Vincent van Gogh.
Thick impasto brushstrokes, swirling sky, rich saturated colors — cadmium yellow awnings,
cobalt blue shadows, vibrant orange and red produce. The paint texture is heavy and visible,
with ridges of oil paint catching the light. Emotional, intense, expressive.
Do NOT include any text, signature, or watermark."
Save as: public/images/hook-vangogh.jpg

🎨 IMAGE 2 (right) — Generate with CHATGPT (DALL-E 3):
"An oil painting of a cat sleeping on a sunlit windowsill next to a vase of wildflowers,
painted in the style of Claude Monet. Soft impressionist brushstrokes, dappled afternoon light
streaming through sheer curtains, gentle pastel palette — lavender, creamy rose, pale sage green.
The edges are soft and dreamy, the light dissolves into color. The painting feels warm, quiet,
and luminous, like a summer afternoon.
Do NOT include any text, signature, or watermark."
Save as: public/images/hook-monet.jpg

Speaker: Show both paintings side by side. Let the audience discuss.
"Take a good look at these two paintings. Who do you think painted each one? Shout it out!"
Give them 30 seconds. Most will guess Van Gogh (left) and Monet (right).
-->

---

<h1 style="text-align: center; margin-bottom: 0.5rem;">The Artist Is... AI</h1>

<div style="display: flex; justify-content: center; gap: 3rem; align-items: flex-start; margin-top: 0.5rem; height: 55%;">
  <div style="text-align: center; flex: 1; max-width: 38%;">
    <div class="prompt-reveal">
      <img :src="'/images/van_gogh_gemini.png'" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 20px rgba(0,0,0,0.5);" />
      <div class="prompt-overlay">
        <p class="prompt-text">A highly textured oil painting of a bustling open-air street market in ancient Jaffa, Israel, rendered strictly in the Post-Impressionist style of Vincent van Gogh. Blistering midday heat. Stalls overflowing with vibrant Jaffa oranges and ruby-red pomegranates. The ancient, weathered limestone archways cast deep, rhythmic cobalt-blue and violet shadows. Above, a swirling, turbulent sky in vivid ultramarine. Heavy, sculptural impasto brushwork, with visible ridges of paint catching the light. Aggressive, directional brushstrokes outlining the figures in the crowd. Masterpiece, intense complementary colors, emotional, expressive. Do NOT include any text, signature, watermark, or modern vehicles.</p>
      </div>
    </div>
    <div style="margin-top: 0.8rem; display: flex; align-items: center; justify-content: center; gap: 0.5rem;">
      <svg width="28" height="28" viewBox="0 0 28 28" fill="none"><path d="M14 0C14 7.732 7.732 14 0 14c7.732 0 14 6.268 14 14 0-7.732 6.268-14 14-14-7.732 0-14-6.268-14-14Z" fill="url(#gemini-g)"/><defs><linearGradient id="gemini-g" x1="2" y1="5" x2="26" y2="24" gradientUnits="userSpaceOnUse"><stop stop-color="#4285F4"/><stop offset=".5" stop-color="#9B72CB"/><stop offset="1" stop-color="#D96570"/></linearGradient></defs></svg>
      <span style="font-size: 1.3rem; font-weight: 600; color: #fff;">Google Gemini</span>
    </div>
  </div>
  <div style="text-align: center; flex: 1; max-width: 38%;">
    <div class="prompt-reveal">
      <img :src="'/images/Monet_chatGPT.png'" style="width: 100%; border-radius: 8px; box-shadow: 0 4px 20px rgba(0,0,0,0.5);" />
      <div class="prompt-overlay">
        <p class="prompt-text">A luminous masterwork oil painting of a cat asleep by a window, executed in the distinctive style of Claude Monet. The focus is entirely on capturing the fleeting "envelope" of light surrounding the subjects. The composition is built from myriad small, rapid strokes of pure, unblended paint that create an optical vibration. Lavender, pale sage green, soft cerulean, and peach hues merge to form the image. The cat is defined by colored shadows (never black or gray), blending into the texture of the windowsill and the vague, shimmering forms of a wildflower bouquet. The light from the window is so intense it seems to dissolve the solid edges of the objects. The paint has visible texture and a matte, chalky finish typical of aged oil on canvas. Dreamy, ethereal, and saturated with soft, natural light. Do NOT include any text, signature, or watermark.</p>
      </div>
    </div>
    <div style="margin-top: 0.8rem; display: flex; align-items: center; justify-content: center; gap: 0.5rem;">
      <svg width="28" height="28" viewBox="0 0 41 41" fill="none"><path d="M37.532 16.87a9.963 9.963 0 0 0-.856-8.184 10.078 10.078 0 0 0-10.855-4.835A9.964 9.964 0 0 0 18.306.5a10.079 10.079 0 0 0-9.614 6.977 9.967 9.967 0 0 0-6.664 4.834 10.08 10.08 0 0 0 1.24 11.817 9.965 9.965 0 0 0 .856 8.185 10.079 10.079 0 0 0 10.855 4.835 9.965 9.965 0 0 0 7.516 3.35 10.078 10.078 0 0 0 9.617-6.981 9.967 9.967 0 0 0 6.663-4.834 10.079 10.079 0 0 0-1.243-11.813ZM22.498 37.886a7.474 7.474 0 0 1-4.799-1.735c.061-.033.168-.091.237-.134l7.964-4.6a1.294 1.294 0 0 0 .655-1.134V19.054l3.366 1.944a.12.12 0 0 1 .066.092v9.299a7.505 7.505 0 0 1-7.49 7.496ZM6.392 31.006a7.471 7.471 0 0 1-.894-5.023c.06.036.162.099.237.141l7.964 4.6a1.297 1.297 0 0 0 1.308 0l9.724-5.614v3.888a.12.12 0 0 1-.048.103l-8.051 4.649a7.504 7.504 0 0 1-10.24-2.744ZM4.297 13.62A7.469 7.469 0 0 1 8.2 10.333c0 .068-.004.19-.004.274v9.201a1.294 1.294 0 0 0 .654 1.132l9.723 5.614-3.366 1.944a.12.12 0 0 1-.114.012L7.044 23.86a7.504 7.504 0 0 1-2.747-10.24Zm27.658 6.437-9.724-5.615 3.367-1.943a.12.12 0 0 1 .113-.012l8.051 4.649a7.497 7.497 0 0 1-1.158 13.528v-9.476a1.293 1.293 0 0 0-.649-1.131Zm3.35-5.043c-.059-.037-.162-.099-.236-.141l-7.965-4.6a1.298 1.298 0 0 0-1.308 0l-9.723 5.614v-3.888a.12.12 0 0 1 .048-.103l8.05-4.645a7.497 7.497 0 0 1 11.135 7.763Zm-21.063 6.929-3.367-1.944a.12.12 0 0 1-.065-.092v-9.299a7.497 7.497 0 0 1 12.293-5.756 6.94 6.94 0 0 0-.236.134l-7.965 4.6a1.294 1.294 0 0 0-.654 1.132l-.006 11.225Zm1.829-3.943 4.33-2.501 4.332 2.5v5l-4.331 2.5-4.331-2.5V18Z" fill="#10a37f"/></svg>
      <span style="font-size: 1.3rem; font-weight: 600; color: #fff;">ChatGPT</span>
    </div>
  </div>
</div>

<p style="text-align: center; font-size: 1.5rem; color: #ccc; margin-top: 0.5rem;">
  The machine is the brush.
</p>
<p style="text-align: center; font-size: 1.5rem; color: #38bdf8; font-weight: 700; margin-top: 0.2rem;">
  YOU are still the artist.
</p>

<style>
.prompt-reveal {
  position: relative;
  overflow: hidden;
  border-radius: 8px;
}
.prompt-overlay {
  position: absolute;
  inset: 0;
  background: rgba(0, 0, 0, 0.88);
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0.15rem 0.6rem;
  opacity: 0;
  transition: opacity 0.3s ease;
  border-radius: 8px;
  overflow-y: auto;
}
.prompt-reveal:hover .prompt-overlay {
  opacity: 1;
}
.prompt-text {
  color: #e0e0e0 !important;
  font-size: 0.65rem !important;
  line-height: 1.3 !important;
  text-align: left;
  font-family: 'Courier New', monospace;
  margin: 0 !important;
}
</style>

<!--
Speaker: Hover over each painting to reveal the exact prompt used to generate it.
"This is all it took — a paragraph of text. The machine did the rest."
Transition: "Let me tell you how I ended up working on this..."
-->

---
layout: updates
---

# My Story

<p style="font-size: 1.5rem; color: #ccc;">
How a mechanical engineer ended up building AI for 3D worlds
</p>

<!--
SECTION 2: "THE MISSING SHAPE" (5 min)
Personal story. The real engineering origin of the career path.
-->

---
layout: media-cols
media: /images/story-pointcloud-vs-cad.jpg
position: right
width: 50%
---

# The Missing Shape

- Studied **Mechanical Engineering** through Atuda (academic military program)

- First engineering job: design a part that connects to a **physical object with a unique shape**

- We had a **3D scanner** in the basement — it sampled points on the surface

- But points are not what engineers need. Engineers need **parametric CAD** models.

- **There was no button** to go from the real world to the computer.

<!--
🎨 GEMINI IMAGE PROMPT (for media):
"Split image: left side shows a messy scattered cloud of thousands of tiny colored dots forming the rough outline of an organic mechanical part floating in dark space, right side shows the same part as a clean precise parametric CAD wireframe model with smooth surfaces and engineering dimension lines, dark background, technical illustration style, the gap between them highlighted with a glowing question mark"

Speaker: This was the moment. The gap between 3D scan and CAD.
Points → usable model. That gap became my entire career.
-->

---
layout: media-cols
media: /images/story-journey.jpg
position: right
width: 45%
---

# That Gap Became My Life's Work

<div style="font-size: 1.4rem; line-height: 2.2;">

🎓 **PhD at Technion** — 3D point cloud understanding

🌏 **Postdoc in Australia** — deep learning for 3D

🇪🇺 **Marie Curie Fellowship** — back at Technion

🎮 **Roblox** — Senior Scientist, building 3D worlds at scale

</div>

<br>

> **"Today — we press that button together."**

<!--
🎨 GEMINI IMAGE PROMPT (for media):
"An illustrated winding path connecting landmarks in a travel journal style: starting at a military academy building, then a university tower with a 3D point cloud floating above it, then the Sydney Opera House, then a European Union flag with golden stars, ending at a modern tech campus with a glowing game controller sign, the path is made of glowing digital dots that gradually become solid 3D rendered shapes as it progresses, warm illustrated storybook style"

Speaker: Foreshadow the Lego → photo → 3D → Roblox pipeline coming later.
"Spoiler alert: by the end of today, we will literally take something you build
with your hands and put it inside a computer. The button exists now."
-->

---
layout: updates
---

# We've Been Here Before

<p style="font-size: 1.5rem; color: #ccc;">
Every great revolution scared people at first
</p>

<!--
SECTION 3: REVOLUTIONS IN 3 MINUTES (3 min)
Fast. Visual. Minimal text. Yuval Noah Harari reference (Sapiens).
-->

---
layout: figure
media: /images/revolutions-fears.jpg
caption: "Every revolution was feared. Every one changed the world for the better. (Inspired by Sapiens, Yuval Noah Harari)"
---

# Every Revolution Scared People

<!--
🎨 GEMINI IMAGE PROMPT:
"Four vintage-style editorial panels in a 2x2 grid on aged paper: (top-left) alarmed monks looking at a Gutenberg printing press with text 'IT WILL DESTROY MEMORY! 1450', (top-right) Victorian people fleeing from an early automobile with text 'DEATH MACHINES! 1900', (bottom-left) a 1990s person terrified of a desktop computer screen with text 'THE END OF PRIVACY! 1995', (bottom-right) a modern person looking at a glowing AI hologram with text 'THE END OF HUMANITY? 2024', sepia tone transitioning to color in the last panel, editorial cartoon satire style, warm paper texture"

Speaker: Quick. "Printing press — they said it would destroy memory. Cars — death machines.
Internet — end of privacy. AI — end of humanity? Every. Single. Time. Wrong."
Mention Harari's Sapiens: "Humanity runs on revolutions. We adapt. We thrive."
-->

---

# The Knowledge Revolution

<div style="display: flex; justify-content: center; align-items: center; gap: 2rem; height: 60%; flex-wrap: wrap;">
  <div style="text-align: center;">
    <div style="font-size: 4rem;">🏛️</div>
    <p style="font-size: 1.2rem; color: #ccc;">Libraries</p>
  </div>
  <div style="font-size: 3rem; color: #38bdf8;">→</div>
  <div style="text-align: center;">
    <div style="font-size: 4rem;">📚</div>
    <p style="font-size: 1.2rem; color: #ccc;">Encyclopedias</p>
  </div>
  <div style="font-size: 3rem; color: #38bdf8;">→</div>
  <div style="text-align: center;">
    <div style="font-size: 4rem;">🌐</div>
    <p style="font-size: 1.2rem; color: #ccc;">Wikipedia</p>
  </div>
  <div style="font-size: 3rem; color: #38bdf8;">→</div>
  <div style="text-align: center;">
    <div style="font-size: 4rem;">🤖</div>
    <p style="font-size: 1.2rem; color: #ccc;">ChatGPT / Gemini</p>
  </div>
</div>

<p style="text-align: center; font-size: 1.5rem; color: #ccc; margin-top: 1rem;">
Each one replaced the last. Each time, <strong style="color: white;">access got easier</strong>.
</p>

<!--
Speaker: "Encyclopedias replaced going to the library. Wikipedia replaced encyclopedias.
And now ChatGPT and Gemini are replacing Wikipedia. Same knowledge — just faster, more personal."
-->

---

# Same Field, New Suit Every 5 Years

<div style="display: flex; justify-content: center; align-items: center; gap: 1.5rem; height: 50%; flex-wrap: wrap;">
  <div style="background: #1e293b; padding: 1.5rem 2rem; border-radius: 12px; text-align: center;">
    <div style="font-size: 1.1rem; color: #94a3b8;">~2010</div>
    <div style="font-size: 1.8rem; font-weight: 700; color: white;">Machine Learning</div>
  </div>
  <div style="font-size: 2.5rem; color: #38bdf8;">→</div>
  <div style="background: #1e293b; padding: 1.5rem 2rem; border-radius: 12px; text-align: center;">
    <div style="font-size: 1.1rem; color: #94a3b8;">~2015</div>
    <div style="font-size: 1.8rem; font-weight: 700; color: white;">Deep Learning</div>
  </div>
  <div style="font-size: 2.5rem; color: #38bdf8;">→</div>
  <div style="background: #1e293b; padding: 1.5rem 2rem; border-radius: 12px; text-align: center;">
    <div style="font-size: 1.1rem; color: #94a3b8;">~2022</div>
    <div style="font-size: 1.8rem; font-weight: 700; color: white;">LLMs</div>
  </div>
  <div style="font-size: 2.5rem; color: #38bdf8;">→</div>
  <div style="background: #1e293b; padding: 1.5rem 2rem; border-radius: 12px; text-align: center;">
    <div style="font-size: 1.1rem; color: #94a3b8;">~2025</div>
    <div style="font-size: 1.8rem; font-weight: 700; color: white;">Agents</div>
  </div>
</div>

<p style="text-align: center; font-size: 1.4rem; color: #ccc; margin-top: 2rem;">
Same technology evolving. New buzzword each cycle. 🙃<br>
<span style="color: #94a3b8; font-size: 1.2rem;">And it's not just about the companies — it's about the <strong style="color: white;">data</strong>.</span>
</p>

<!--
Speaker: Light humor. "The media loves a new name. But it's the same field, just growing up.
Machine learning → deep learning → large language models → agents.
And remember: the real power isn't in OpenAI or Google — it's in the DATA they trained on.
Your data. The internet's data. That's the real asset."
-->

---
layout: updates
---

# The AI Timeline

<p style="font-size: 1.5rem; color: #ccc;">
14 years of breakthroughs — accelerating
</p>

<!--
SECTION 4: AI BREAKTHROUGHS SPEED RUN (4 min)
One dense visual timeline. Tell the story quickly.
-->

---
layout: figure
media: /images/ai-timeline.jpg
caption: "Notice the gaps getting shorter? We're living on the steepest part of the curve."
---

# The Speed of Change

<!--
🎨 GEMINI IMAGE PROMPT:
"A beautiful glowing horizontal timeline infographic from 2012 to 2026 on a dark background. Each milestone is a glowing node on the line with a small icon and label: 2012 AlexNet (camera lens icon), 2014 GANs (two mirrored face silhouettes), 2017 PointNet (3D point cloud) and Transformers (attention eye icon), 2018 GPT-1 (speech bubble), 2020 GPT-3 (larger speech bubble), 2021 DALL-E (paintbrush), 2022 ChatGPT (chat window icon) and Stable Diffusion (diffusion pattern), 2023 GPT-4 (brain), 2024 Flow Matching (flowing river icon) and Sora video generation (film strip), 2025-2026 Agents (robot hand) and 3D Generation (3D cube). The gaps between nodes visibly decrease toward the right showing acceleration. Neon blue and purple glow, futuristic clean infographic style"

Speaker: Walk through FAST:
"2012: computers first beat humans at recognizing images.
2014: AI learned to create fake images — GANs.
2017: AI understood 3D points (my field!) AND the Transformer was invented — the engine behind everything today.
2018-2020: GPT language models — 1, 2, 3 — each bigger.
2021: DALL-E — type text, get an image.
2022: ChatGPT goes viral — AI goes mainstream.
2024: Video generation, Flow Matching — making things look real.
2025-26: Agents that can use tools, and generating 3D worlds from text.
Notice something? The gaps get shorter. We're accelerating."
-->

---
layout: updates
---

# ✏️ Your Turn: AI Caricature

<p style="font-size: 1.5rem; color: #ccc;">
Time to try it yourself!
</p>

<!--
SECTION 5: CARICATURE WORKSHOP (12 min)
Interactive break between theory blocks. They do it themselves on their phones.
Pre-homework: photo + 3-5 traits. Now they learn to prompt.
-->

---

# Remember Your Homework?

<div style="font-size: 1.5rem; line-height: 2;">

📸 You each brought a **photo of yourself**

📝 And a list of **3–5 things** that define you

</div>

<br>

### Here's what happens when we give that to AI:

<div style="display: flex; justify-content: center; gap: 3rem; margin-top: 2rem; align-items: center;">
  <div style="text-align: center;">
    <div style="font-size: 1rem; color: #94a3b8; margin-bottom: 0.5rem;">📷 Original</div>
    <div style="width: 200px; height: 200px; background: #1e293b; border-radius: 12px; display: flex; align-items: center; justify-content: center; font-size: 4rem;">🧑</div>
  </div>
  <div style="font-size: 3rem; color: #38bdf8;">→ 🤖 →</div>
  <div style="text-align: center;">
    <div style="font-size: 1rem; color: #94a3b8; margin-bottom: 0.5rem;">🎨 AI Caricature</div>
    <div style="width: 200px; height: 200px; background: #1e293b; border-radius: 12px; display: flex; align-items: center; justify-content: center; font-size: 4rem;">🎭</div>
  </div>
</div>

<!--
🎨 GEMINI IMAGE PROMPT (for demo examples — pre-generate 2-3):
"A colorful fun cartoon caricature of a cheerful 65-year-old man standing on the Eilat promenade boardwalk, with exaggerated friendly features and a big warm smile, the Red Sea and palm trees visible in the background, floating icons around him showing his passions: a hiking boot, a book, a chess piece, and a plate of hummus, bright sunny day, fun editorial cartoon style with bold outlines and vibrant colors"

Speaker: Show 1-2 pre-generated examples.
JOKE: "And yes, ChatGPT keeps insisting on putting everyone on the Eilat promenade...
at least it has good taste in vacation spots!"
-->

---

# Let's Make Yours — Together! 🎨

### The prompt template:

<div style="background: #1e293b; padding: 2rem; border-radius: 12px; font-size: 1.3rem; line-height: 1.8; margin: 1.5rem 0;">

**Open ChatGPT on your phone** → tap the camera icon → upload your photo → paste this:

<br>

*"Create a colorful cartoon caricature of the person in this photo. Make it fun and exaggerated with a warm friendly style. They are passionate about **[your trait 1]**, **[your trait 2]**, and **[your trait 3]**. Include visual elements representing these passions floating around them. Place them on the Eilat promenade with the Red Sea in the background."*

</div>

<p style="text-align: center; font-size: 1.5rem; margin-top: 1rem;">

📱 **Go ahead — you have 8 minutes!**

<br><span style="color: #94a3b8; font-size: 1.2rem;">Show your neighbors when you're done! This is something you can do tonight with your grandkids.</span>
</p>

<!--
Speaker: Walk around and help people. Have a QR code printed that links to ChatGPT.
For those without smartphones, pair them with a neighbor.
WiFi info should be displayed or on a handout.
This is the KEY takeaway: they learn a skill, not just watch a demo.
After ~8 min: "Show your neighbors! Beautiful. You are all AI artists now."
-->

---
layout: updates
---

# Behind the Curtain

<p style="font-size: 1.5rem; color: #ccc;">
So what just happened when you made that caricature?
</p>

<!--
SECTION 6: HOW AI WORKS (5 min)
Now that they've USED AI, the "how" has concrete meaning.
Keep it simple. Neuron analogy, agents = intern, AI as utility.
-->

---
layout: media-cols
media: /images/neuron-comparison.jpg
position: right
width: 50%
---

# The Building Block

### Your brain vs. the machine

- **Your neurons:** electrical & chemical signals, ~86 billion, massively parallel

- **AI neurons:** math (multiply, add, activate), billions of parameters, layer by layer

- **Same idea:** inputs → processing → output

- **Key difference:** yours learn from *living*. AI learns from *data*.

<!--
🎨 GEMINI IMAGE PROMPT:
"A side-by-side educational comparison illustration: left side shows a beautiful biological neuron with glowing golden dendrites receiving signals, a cell body, and an axon transmitting output, labels 'Inputs (dendrites)', 'Processing (cell body)', 'Output (axon)'. Right side shows an artificial neuron diagram with the same structure: multiple input arrows with weights, a summation circle with activation function, and one output arrow, labels 'Inputs x Weights', 'Sum + Activate', 'Output'. Both connected by a large equals sign with a small asterisk. Dark background, clean scientific illustration style, warm colors for biological side, cool blue for artificial side"

Speaker: "Your brain has 86 billion neurons connected in incredible ways.
An AI model has billions of simple math operations stacked in layers.
Same basic idea — inputs, processing, output.
But YOUR neurons learn from living, experiencing, feeling.
AI neurons learn from data — text, images, the internet.
That's why it can paint like Van Gogh but can't tell you why sunflowers are beautiful."
-->

---

# "But What About AI Agents?"

<div style="display: flex; justify-content: center; align-items: center; height: 55%; gap: 3rem;">
  <div style="text-align: center; max-width: 500px;">
    <div style="font-size: 6rem; margin-bottom: 1rem;">🤖🧰</div>
    <h3 style="color: #38bdf8; font-size: 2rem; margin-bottom: 1rem;">Agent = AI + Tools</h3>
    <p style="font-size: 1.4rem; color: #ccc; line-height: 1.8;">
      Think of it as a <strong style="color: white;">very fast intern</strong><br>
      with a small toolbox.<br><br>
      It can only do what<br>the <strong style="color: #38bdf8;">tools allow</strong>.
    </p>
  </div>
</div>

<p style="text-align: center; font-size: 1.3rem; color: #94a3b8; margin-top: 1rem;">
That ChatGPT you just used? It had a camera tool and a drawing tool.<br>
No tools = no caricature. <strong style="color: #ccc;">You're the one who directed it.</strong>
</p>

<!--
Speaker: "You hear 'AI agents' in the news and it sounds scary — like robots taking over.
But an agent is just AI connected to tools — a camera, a text editor, a calculator.
Take away the tools? It's just a brain in a jar. It can't DO anything.
That ChatGPT caricature? It had a camera tool and a drawing tool.
YOU told it what to draw. Without you — nothing happens."
-->

---

# AI Is Becoming a Utility

<div style="display: flex; justify-content: center; align-items: center; gap: 2rem; height: 55%; flex-wrap: wrap;">
  <div style="background: #1e293b; padding: 2rem; border-radius: 12px; text-align: center; width: 150px;">
    <div style="font-size: 3rem;">⚡</div>
    <p style="color: #ccc; font-size: 1.1rem; margin-top: 0.5rem;">Electricity<br>Bill</p>
  </div>
  <div style="background: #1e293b; padding: 2rem; border-radius: 12px; text-align: center; width: 150px;">
    <div style="font-size: 3rem;">💧</div>
    <p style="color: #ccc; font-size: 1.1rem; margin-top: 0.5rem;">Water<br>Bill</p>
  </div>
  <div style="background: #1e293b; padding: 2rem; border-radius: 12px; text-align: center; width: 150px;">
    <div style="font-size: 3rem;">📱</div>
    <p style="color: #ccc; font-size: 1.1rem; margin-top: 0.5rem;">Phone<br>Bill</p>
  </div>
  <div style="background: linear-gradient(135deg, #1e3a5f, #1e293b); padding: 2rem; border-radius: 12px; text-align: center; width: 150px; border: 2px solid #38bdf8;">
    <div style="font-size: 3rem;">🧠</div>
    <p style="color: #38bdf8; font-size: 1.1rem; margin-top: 0.5rem; font-weight: 700;">AI Token<br>Bill</p>
  </div>
</div>

<p style="text-align: center; font-size: 1.5rem; color: #ccc; margin-top: 2rem;">
Just like electricity became a bill you pay monthly,<br>
<strong style="color: white;">AI will be another utility</strong>. Tokens are the new minutes.
</p>

<!--
Speaker: "Think about it. Your grandparents were amazed by electricity.
Now it's just a bill. Same with phones, internet.
AI is heading the same way — you'll pay for 'tokens' like you pay for minutes.
Nothing scary. Just another tool that becomes part of life."
-->

---
layout: updates
---

# 🧱 ✍️ Workshop Time!

<p style="font-size: 1.8rem; color: #ccc;">
Builders & Poets — let's create!
</p>

<!--
SECTION 7: BUILDERS & POETS WORKSHOP (15 min)
Split into two groups. Builders make a Lego mascot. Poets write an anthem.
-->

---

# Split Into Two Groups!

<div style="display: flex; justify-content: center; gap: 4rem; height: 60%; align-items: center;">
  <div style="background: #1e293b; padding: 3rem; border-radius: 16px; text-align: center; width: 350px;">
    <div style="font-size: 5rem; margin-bottom: 1rem;">🧱</div>
    <h2 style="color: #f59e0b; font-size: 2.2rem; margin-bottom: 1rem;">Builders</h2>
    <p style="font-size: 1.3rem; color: #ccc; line-height: 1.6;">
      Build a <strong style="color: white;">Lego mascot</strong><br>for your team!<br><br>
      <span style="color: #94a3b8; font-size: 1.1rem;">Be creative. Be weird. Be bold.</span>
    </p>
  </div>
  <div style="background: #1e293b; padding: 3rem; border-radius: 16px; text-align: center; width: 350px;">
    <div style="font-size: 5rem; margin-bottom: 1rem;">✍️</div>
    <h2 style="color: #a78bfa; font-size: 2.2rem; margin-bottom: 1rem;">Poets</h2>
    <p style="font-size: 1.3rem; color: #ccc; line-height: 1.6;">
      Write a short <strong style="color: white;">anthem or cheer</strong><br>for your team!<br><br>
      <span style="color: #94a3b8; font-size: 1.1rem;">4–8 lines. Rhymes welcome!</span>
    </p>
  </div>
</div>

<!--
Speaker: "Left side of the room — you're builders. Right side — poets.
Builders: grab the Lego bricks from the bags. Build your team a mascot.
Any shape, animal, creature — surprise me.
Poets: grab paper and pens. Write 4-8 lines. A team anthem. It can be funny,
inspiring, silly — just make it yours.
You have 15 minutes. GO!"
-->

---

<div style="display: flex; justify-content: center; align-items: center; height: 80%; flex-direction: column;">
  <h1 style="font-size: 4rem; font-weight: 900; margin-bottom: 2rem;">⏱️ 15:00</h1>
  <p style="font-size: 1.8rem; color: #ccc;">Build! Write! Create!</p>
  <br>
  <p style="font-size: 1.2rem; color: #94a3b8;">🎵 Background music playing...</p>
</div>

<!--
Speaker: Start a 15-minute timer on your phone.
Play some light background music. Walk around, encourage, help.
5 min warning: "5 minutes left!"
2 min warning: "Finish up!"
-->

---
layout: updates
---

# 🔘 Let's Press THE BUTTON

<p style="font-size: 1.5rem; color: #ccc;">
Remember the missing shape? Today we close the gap.
</p>

<!--
SECTION 8: AI ENHANCEMENT — "PRESS THE BUTTON" (15 min)
Live demo. Lego → photo → Gemini → Meshy → Roblox. Poem → Gemini → Suno.
Have pre-generated backups ready in case of connectivity issues.
-->

---

# Step 1: Photograph the Mascot 📸

<div style="display: flex; justify-content: center; align-items: center; height: 60%; flex-direction: column;">
  <div style="font-size: 8rem; margin-bottom: 2rem;">📸 → 🧱</div>
  <p style="font-size: 1.5rem; color: #ccc; text-align: center;">
    Let's take a photo of what the Builders created.<br>
    <span style="color: #94a3b8;">Good lighting, white background if possible.</span>
  </p>
</div>

<!--
Speaker: Take the photo live. Show it on screen.
"Beautiful! Now let's give it to AI..."
-->

---

# Step 2: Enhance with Gemini ✨

<div style="background: #1e293b; padding: 2rem; border-radius: 12px; font-size: 1.2rem; line-height: 1.8; margin: 1rem 0;">

### Gemini Prompt:

*"Take this photo of a Lego figure and create polished character concept art of this mascot. Keep the same proportions, colors, and personality but make it look like a professional game character design. Studio lighting, white background, suitable as a 3D game character. Show front view."*

</div>

<div style="display: flex; justify-content: center; align-items: center; gap: 3rem; margin-top: 2rem;">
  <div style="text-align: center;">
    <div style="font-size: 1rem; color: #94a3b8;">📷 Photo</div>
    <div style="width: 180px; height: 180px; background: #0f172a; border-radius: 12px; display: flex; align-items: center; justify-content: center; font-size: 4rem;">🧱</div>
  </div>
  <div style="font-size: 3rem; color: #38bdf8;">→ ✨ →</div>
  <div style="text-align: center;">
    <div style="font-size: 1rem; color: #94a3b8;">🎨 Concept Art</div>
    <div style="width: 180px; height: 180px; background: #0f172a; border-radius: 12px; display: flex; align-items: center; justify-content: center; font-size: 4rem;">🎮</div>
  </div>
</div>

<!--
Speaker: Open Gemini. Upload the photo. Paste the prompt.
Show the result. "From Lego bricks to concept art in 10 seconds."
Have a pre-generated backup ready in /images/demo-gemini-enhanced.jpg
-->

---

# Step 3: Turn It into 3D — Meshy 🧊

<div style="background: #1e293b; padding: 2rem; border-radius: 12px; font-size: 1.3rem; line-height: 1.8; margin: 1.5rem 0; text-align: center;">

Upload the enhanced image to <strong style="color: #38bdf8;">meshy.ai</strong><br>
→ Select "Image to 3D"<br>
→ Wait ~2 minutes<br>
→ Download the 3D model

</div>

<div style="display: flex; justify-content: center; align-items: center; gap: 3rem; margin-top: 2rem;">
  <div style="font-size: 4rem;">🎨</div>
  <div style="font-size: 3rem; color: #38bdf8;">→ 🧊 →</div>
  <div style="font-size: 4rem;">🏗️</div>
</div>

<p style="text-align: center; font-size: 1.2rem; color: #94a3b8; margin-top: 1.5rem;">
2D image → 3D model with textures. This is the "button" I dreamed about.
</p>

<!--
Speaker: Open meshy.ai. Upload. Start the generation.
"This takes about 2 minutes, so while it processes, let's work on the poem."
If pre-generated backup needed: show a screen recording of the process.
Website: https://www.meshy.ai/
-->

---

# Step 4: Into Roblox! 🎮

<div style="display: flex; justify-content: center; align-items: center; height: 55%; flex-direction: column;">
  <div style="font-size: 6rem; margin-bottom: 2rem;">🧱 → 📸 → ✨ → 🧊 → 🎮</div>
  <p style="font-size: 1.8rem; color: white; text-align: center; font-weight: 700;">
    From a pile of Lego bricks<br>to a character in a digital world.
  </p>
  <p style="font-size: 1.3rem; color: #94a3b8; margin-top: 1rem;">
    Import the 3D model into Roblox Studio → place in a scene → done.
  </p>
</div>

<!--
Speaker: Import the .obj or .fbx file from Meshy into Roblox Studio.
Place it in a simple scene. Show it on screen.
"From real Lego bricks on this table → to a digital character in a game.
We just pressed THE BUTTON. The one that didn't exist when I started my career."
HUGE moment. Let it land.
-->

---

# Now the Poem! 🎵

<div style="background: #1e293b; padding: 2rem; border-radius: 12px; font-size: 1.2rem; line-height: 1.8; margin: 1rem 0;">

### Step 1: Gemini Polish

*"Take this anthem written by a group and enhance the rhythm. Keep the original heart and meaning but make it singable with a verse-chorus-verse structure. Add vivid imagery. Keep it warm and fun."*

</div>

<div style="background: #1e293b; padding: 2rem; border-radius: 12px; font-size: 1.2rem; line-height: 1.8; margin: 1rem 0;">

### Step 2: Suno Music

*"Upbeat folk anthem, community choir style, joyful and clap-along, acoustic guitar and tambourine, warm and celebratory, Hebrew-English mix"*

</div>

<p style="text-align: center; font-size: 1.3rem; color: #94a3b8; margin-top: 1rem;">
Website: <strong style="color: #38bdf8;">suno.com</strong>
</p>

<!--
Speaker: Read the original poem out loud first. "Beautiful. Now let's give it superpowers."
1. Paste into Gemini with the polish prompt. Show the enhanced version.
2. Paste lyrics into Suno. Generate.
3. Play the result for everyone. This is usually a BIG crowd-pleaser.
Have a pre-generated backup song ready.
-->

---
layout: updates
---

# 🎉 Show & Tell

<p style="font-size: 1.5rem; color: #ccc;">
Let's see what we created together!
</p>

<!--
SECTION 9: SHOW & TELL (5 min)
Show the 3D mascot in Roblox. Play the anthem. Celebrate.
-->

---

# Look What We Made Together

<div style="display: flex; justify-content: center; gap: 4rem; height: 60%; align-items: center;">
  <div style="background: #1e293b; padding: 2.5rem; border-radius: 16px; text-align: center; width: 300px;">
    <div style="font-size: 4rem; margin-bottom: 1rem;">🎮</div>
    <h3 style="color: #f59e0b; font-size: 1.5rem;">The Mascot</h3>
    <p style="font-size: 1.1rem; color: #94a3b8; margin-top: 0.5rem;">Living in Roblox</p>
  </div>
  <div style="background: #1e293b; padding: 2.5rem; border-radius: 16px; text-align: center; width: 300px;">
    <div style="font-size: 4rem; margin-bottom: 1rem;">🎵</div>
    <h3 style="color: #a78bfa; font-size: 1.5rem;">The Anthem</h3>
    <p style="font-size: 1.1rem; color: #94a3b8; margin-top: 0.5rem;">A real song!</p>
  </div>
  <div style="background: #1e293b; padding: 2.5rem; border-radius: 16px; text-align: center; width: 300px;">
    <div style="font-size: 4rem; margin-bottom: 1rem;">🎭</div>
    <h3 style="color: #38bdf8; font-size: 1.5rem;">Your Caricatures</h3>
    <p style="font-size: 1.1rem; color: #94a3b8; margin-top: 0.5rem;">Take home!</p>
  </div>
</div>

<p style="text-align: center; font-size: 1.5rem; color: #ccc; margin-top: 2rem;">
From Lego bricks, paper, and a photo → to a game character, a song, and digital art.<br>
<strong style="color: white;">You did this. Not the machine. You directed it.</strong>
</p>

<!--
Speaker: Show the Roblox scene with the mascot. Play the Suno anthem.
Ask a few people to show their caricatures.
"We made a game character, a song, and personalized art — in 90 minutes.
And the most important thing? None of this happened without YOU.
The AI didn't choose the mascot shape. The AI didn't write the poem.
The AI didn't pick your passions for the caricature. YOU did."
-->

---
layout: updates
---

# The Future Is Bright

<p style="font-size: 1.5rem; color: #ccc;">
And it needs your voice in it
</p>

<!--
SECTION 10: CLOSING (3 min)
Inspirational. Tie back to revolutions. Healthcare + education.
Our greatest tool is adaptability.
-->

---
layout: media-cols
media: /images/bright-future.jpg
position: right
width: 50%
---

# What's Coming

### Healthcare
- AI-assisted diagnostics
- Personalized treatment plans
- 24/7 health monitoring

### Education
- A personal tutor for every child
- Learning adapted to YOUR pace
- Knowledge in any language, instantly

<br>

> It's not about replacing people. It's about **giving every person superpowers**.

<!--
🎨 GEMINI IMAGE PROMPT:
"A warm hopeful split illustration: left side shows a friendly doctor with an AI holographic display helping an elderly patient review health data together both smiling, right side shows a diverse group of children each learning with their own friendly glowing AI tutor hologram customized to their interests, both scenes use warm golden lighting, human-centered composition, not cold or clinical, soft watercolor digital art style with a sense of hope and possibility"

Speaker: "The future of AI isn't robots taking jobs.
It's a doctor who can diagnose faster AND have more time for you.
It's a tutor that adapts to every child's pace — not just the ones who can afford private lessons.
It's knowledge without barriers."
-->

---

# Our Greatest Tool

<div style="display: flex; justify-content: center; align-items: center; height: 65%; flex-direction: column;">
  <h2 style="font-size: 3.5rem; font-weight: 900; text-align: center; line-height: 1.3; max-width: 800px;">
    People feared the printing press.<br>
    <span style="color: #94a3b8;">We got libraries.</span><br><br>
    People feared automobiles.<br>
    <span style="color: #94a3b8;">We got freedom.</span><br><br>
    People feared the internet.<br>
    <span style="color: #94a3b8;">We got connection.</span><br><br>
    People fear AI.<br>
    <span style="color: #38bdf8;">We'll get...</span>
  </h2>
</div>

<!--
Speaker: Read this slowly. Build the rhythm.
Pause at "We'll get..." — then advance to the next slide.
-->

---

<div style="display: flex; justify-content: center; align-items: center; height: 80%; flex-direction: column;">
  <h1 style="font-size: 5rem; font-weight: 900; background: linear-gradient(135deg, #38bdf8, #a78bfa, #f59e0b); -webkit-background-clip: text; -webkit-text-fill-color: transparent; text-align: center; line-height: 1.2;">
    ...superpowers.
  </h1>
  <br>
  <p style="font-size: 2rem; color: #ccc; text-align: center; max-width: 700px; line-height: 1.6;">
    Our greatest tool has never been technology.<br>
    It's our ability to <strong style="color: white;">adapt</strong>.<br><br>
    <span style="font-size: 1.5rem; color: #94a3b8;">And today, you proved it.</span>
  </p>
</div>

<!--
Speaker: "You adapted to computers. To the internet. To smartphones.
And today — you created art, a game character, and a song with AI.
That's not scary. That's EXCITING. And you should be proud."
-->

---
layout: end
---

# Thank You! 🙏

<p style="font-size: 1.5rem; color: #ccc; margin-bottom: 2rem;">
The future is being built right now. And it needs your stories.
</p>

<div class="presenter-info">
Itzik (Yizhak) Ben-Shabat
<br>
<span style="font-size: 1rem; color: #94a3b8;">Senior Scientist, Roblox</span>
</div>

---

# Resources & Links 📚

<div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1.5rem; font-size: 1.2rem; padding: 1rem 2rem;">

<div>

### 📖 Books & Papers
- **Sapiens** — Yuval Noah Harari
- [PointNet Paper](https://arxiv.org/abs/1612.00593)
- [Attention Is All You Need](https://arxiv.org/abs/1706.03762)

### 🎨 Tools We Used
- [ChatGPT](https://chat.openai.com/) — Caricatures
- [Google Gemini](https://gemini.google.com/) — Image Enhancement
- [Meshy.ai](https://www.meshy.ai/) — Image to 3D
- [Suno](https://suno.com/) — AI Music

</div>

<div>

### 🎮 Platforms
- [Roblox Studio](https://www.roblox.com/create)

### 🧠 Learn More
- [Google AI Experiments](https://experiments.withgoogle.com/collection/ai)
- [Teachable Machine](https://teachablemachine.withgoogle.com/)

### 📱 Try at Home
- Make caricatures with your family!
- Turn drawings into 3D models
- Create songs from poems

</div>

</div>

<!--
Speaker: "All these links will be in a handout / QR code.
Go home and try these with your families.
Make caricatures of your grandkids. Turn their drawings into 3D models.
The tools are free or very cheap. The only limit is your imagination."
-->
