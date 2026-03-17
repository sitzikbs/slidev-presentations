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

<h1 style="text-align: center; margin-bottom: 0.5rem;">The Artist Is... Me! (+AI) </h1>

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
How a mechanical engineer ended up building AI for 3D worlds?
</p>

<!--
SECTION 2: "THE MISSING SHAPE" (5 min)
Personal story. The real engineering origin of the career path.
-->

---
layout: media-cols
media: /images/point_cloud_to_cad.png
position: right
width: 38%
---

# The Missing Shape

- Studied **Mechanical Engineering**

- First job: design a part that fits a **unique physical shape**

- The **3D scanner** gave us points — but engineers need **CAD models**

- **No button existed** to bridge that gap

<!--
🎨 GEMINI IMAGE PROMPT (for media):
"Split image: left side shows a messy scattered cloud of thousands of tiny colored dots forming the rough outline of an organic mechanical part floating in dark space, right side shows the same part as a clean precise parametric CAD wireframe model with smooth surfaces and engineering dimension lines, dark background, technical illustration style, the gap between them highlighted with a glowing question mark"

Speaker: This was the moment. The gap between 3D scan and CAD.
Points → usable model. That gap became my entire career.
-->

---
layout: figure
media: /images/Career_Evolution.png
---

# That Gap Became My Life's Work

<p style="position: absolute; bottom: 3.5rem; left: 0; right: 0; text-align: center; font-size: 1.5rem; font-weight: 700; color: #38bdf8; z-index: 10;">
"Today — we will press that button together!"
</p>

<!--
🎨 GEMINI IMAGE PROMPT (for media):
"A humorous evolution-of-man style illustration walking left to right on a dark background. Instead of apes becoming humans, show 5 Lego/Roblox-style blocky characters progressing through career stages. Stage 1 (leftmost): a small student character wearing a graduation cap and holding a glowing 3D point cloud, with a tiny Israeli flag and the word 'PhD' above — represents Technion, Israel. Stage 2: a slightly taller character with a backpack and a kangaroo beside them, holding a neural network diagram, with 'Postdoc' above — represents Australia. Stage 3: the character is now wearing a lab coat with EU golden stars on the sleeve, holding a glowing fellowship certificate, with 'Fellowship' above — represents Marie Curie back in Israel. Stage 4: a confident character in a hoodie with the Roblox logo, holding a game controller in one hand and a 3D cube in the other, with 'Roblox' above. Stage 5 (rightmost): the fully evolved character is tall, glowing, standing on a podium made of Lego bricks, radiating light. A subtle dotted arrow runs left to right underneath them all showing progression. Fun, colorful, clean vector illustration style with a dark background, warm lighting."

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
media: /images/Revolutions.png
caption: "Every revolution was feared. Every one changed the world for the better. (Inspired by Sapiens, Yuval Noah Harari)"
---

# Every Revolution Scared People

<!--
🎨 GEMINI IMAGE PROMPT:
"Four vintage-style editorial panels in a 2x2 grid on aged paper: (top-left) alarmed monks gathered around a Gutenberg printing press, one holding a scroll protectively, with bold text 'IT WILL SPREAD LIES AND HERESY! ~1450', (top-right) angry Luddite workers smashing a large textile loom in a dark factory, with bold text 'MACHINES WILL STEAL OUR JOBS! ~1800', (bottom-left) a worried 1990s parent standing behind a child glued to a bulky desktop computer in a dark room, with bold text 'IT WILL ROT OUR CHILDREN\'S BRAINS! ~1995', (bottom-right) a modern person staring up at a towering glowing AI hologram with neural network patterns, with bold text 'IT WILL REPLACE US ALL! ~2024', sepia tone in the first two panels transitioning to muted color then full color in the last panel, editorial cartoon satire style, warm aged paper texture, hand-drawn ink line art feel"

Speaker: Quick. "The printing press — the Church said it would spread heresy and lies.
The Industrial Revolution — workers literally smashed machines, terrified of losing their jobs. Sound familiar?
The Internet — parents panicked it would rot children's brains.
And now AI — it will replace us all.
Every. Single. Time. We adapted. We thrived."
Mention Harari's Sapiens: "Humanity runs on revolutions. Each one automated something we did — 
writing, labor, information, and now intelligence. And each time, we found new things to do."
-->

---

# Why We Always Get It Wrong

<div style="display: flex; justify-content: center; margin-top: 0.2rem;">
  <img :src="'/images/hollywood_vs_reality.png?v=2'" style="height: 280px; border-radius: 8px; box-shadow: 0 4px 24px rgba(0,0,0,0.5);" />
</div>

<div style="display: flex; flex-direction: column; gap: 0.4rem; margin-top: 0.4rem; padding: 0 1.5rem;">
  <div style="display: flex; align-items: stretch; gap: 0.5rem;">
    <div style="background: rgba(248,113,113,0.08); border: 1px solid rgba(248,113,113,0.25); border-radius: 8px; padding: 0.35rem 0.7rem; flex: 1; display: flex; align-items: center; gap: 0.6rem;">
      <img :src="'/images/bttf_poster.jpg'" style="height: 52px; border-radius: 4px;" />
      <div>
        <p style="font-size: 0.85rem; color: #ccc; margin: 0;"><strong style="color: #f87171;">Back to the Future II</strong> <span style="color: #64748b; font-size: 0.8rem;">'89</span></p>
        <p style="font-size: 0.8rem; color: #ccc; margin: 0.15rem 0 0 0;">same town + flying cars & hoverboards</p>
      </div>
    </div>
    <div style="display: flex; align-items: center; font-size: 1.1rem; color: #38bdf8;">→</div>
    <div style="background: rgba(74,222,128,0.08); border: 1px solid rgba(74,222,128,0.25); border-radius: 8px; padding: 0.35rem 0.7rem; flex: 1; display: flex; align-items: center;">
      <p style="font-size: 0.85rem; color: #ccc; margin: 0; white-space: nowrap;">Smartphones changed how we do <em>everything</em></p>
    </div>
  </div>
</div>

<p style="text-align: center; margin-top: 0.5rem; font-size: 1.05rem; line-height: 1.5;">
  <span style="color: #f87171;">Hollywood adds <strong>one cool thing</strong> to the same world</span><br>
  <span style="color: #4ade80;">Reality quietly <strong>changes everything</strong></span>
</p>

<!--
🎨 GEMINI IMAGE PROMPT:
"A split-screen illustration in a fun editorial style, dark background. Left half labeled 'HOLLYWOOD' in bold red: shows a colorful 1980s suburban town square (Hill Valley style) with a flying DeLorean car soaring overhead, a kid on a hoverboard zipping past, and a holographic Jaws shark billboard — but the houses, streets, and people are exactly the same as the 1980s, just with one flashy gadget added. Right half labeled 'REALITY' in green: shows the same suburban street but EVERYTHING is subtly different — people walking while staring at smartphones, a kid on the lawn wearing a VR headset, a delivery drone overhead, a Ring doorbell camera on every house, someone video-calling on a tablet on the porch, an electric car in the driveway, a smart speaker on a windowsill — no flying cars anywhere, but nothing is the same as before. Clean vector illustration style, vibrant colors, the contrast should be humorous and obvious."
Save as: public/images/hollywood_vs_reality.png

Speaker: "We all grew up on Back to the Future. Remember their version of 2015?
Same Hill Valley, just add flying cars and hoverboards. That's it.

That's how Hollywood imagines the future — take today's world, change ONE dramatic thing, 
keep everything else exactly the same.

But look at what actually happened. No flying cars. No hoverboards.
Instead, smartphones quietly changed how we communicate, date, work, shop, navigate, 
raise kids, and even sleep. EVERYTHING changed — not one thing.

(I learned this framing from Rodney Brooks — one of the greatest roboticists alive —
he calls it one of the 'Seven Deadly Sins of Predicting the Future of AI.')

AI won't add one dramatic gadget to your life. It'll be a million small changes 
to how you write, learn, create, and play — like the caricature you just made."
-->

---
layout: figure
media: /images/knowledge_revolution.png
caption: "Each one replaced the last. Each time, access got easier."
---

# The Knowledge Revolution

<!--
🎨 GEMINI IMAGE PROMPT:
"A horizontal evolution-style illustration on a dark background showing 4 stages of how humans access knowledge, progressing left to right with glowing arrows between them. Stage 1: a grand ancient library with tall bookshelves and a person climbing a ladder to reach a book, warm candlelight, labeled 'LIBRARIES'. Stage 2: a cozy living room with a family gathered around a thick encyclopedia set on a wooden bookshelf, 1970s warm tones, labeled 'ENCYCLOPEDIAS'. Stage 3: a glowing computer monitor showing the Google search page and a Wikipedia article side by side, early 2000s feel with a desk lamp, labeled 'GOOGLE + WIKIPEDIA'. Stage 4: a modern person casually holding a smartphone with a glowing AI chat interface, the AI response floating above the phone as holographic text, futuristic blue glow, labeled 'AI ASSISTANTS'. Each stage should be visually distinct with its own color temperature — warm/amber for libraries, cozy/yellow for encyclopedias, cool/white for internet, vibrant/blue-purple for AI. The progression should feel like an acceleration — the stages get closer together toward the right. Clean editorial illustration style, vibrant colors, no text other than the labels."
Save as: public/images/knowledge_revolution.png

Speaker: "Think about how you used to find information.
You'd go to the library — open specific hours, hope the book was there.
Then encyclopedias — Britannica at home, but outdated before you finished reading.
Then Google and Wikipedia — instant, free, from anywhere.
And now? You ASK a question in plain language and get a personal answer.
Same knowledge — just faster, easier, more personal every time."
-->

<!-- COMMENTED OUT — Slide 12: Same Field, New Suit Every 5 Years (feels out of place for now)
To restore: uncomment and add slide separator (three dashes) before and after.

Content: ML ~2010 → DL ~2015 → LLMs ~2022 → Agents ~2025
Punchline: "Same technology evolving. New buzzword each cycle."
Speaker notes: Light humor about media renaming the field.
"The real power isn't in OpenAI or Google — it's in the DATA they trained on."
-->

---
layout: updates
---

# The AI Timeline

<p style="font-size: 1.5rem; color: #ccc;">
70 years of breakthroughs — accelerating
</p>

<!--
SECTION 4: AI BREAKTHROUGHS SPEED RUN (4 min)
One dense visual timeline. Tell the story quickly.
-->

---

# The Speed of Change

<div style="display: flex; justify-content: center; margin-top: -1.7rem;">
  <img :src="'/images/Evolution_of_AI.png'" style="width: 985%; border-radius: 8px;" />
</div>

<p style="text-align: center; color: #9ca3af; font-size: 1rem; font-style: italic; margin-top: -2.5rem;">
Notice the gaps getting shorter? We're living on the steepest part of the curve.
</p>

<!--
🎨 GEMINI IMAGE PROMPT:
"A beautiful glowing horizontal timeline infographic spanning from 1957 to 2026+ on a dark background. The timeline is divided into two visual eras: a slow sparse LEFT section (1957–2007) with muted warm tones and wider gaps between nodes, and a dense accelerating RIGHT section (2012–2026) with vibrant neon blue/purple glow and nodes packed closer together. Milestones as glowing nodes with small icons and labels: 1957 Perceptron (single neuron icon), 1986 Backpropagation (gradient arrow flowing backward through layers), 1989 CNNs/LeNet (small grid/filter icon), 2007 NVIDIA CUDA (GPU chip icon, green glow), 2012 AlexNet (camera lens icon, spark connecting it to the GPU node), 2014 GANs (two mirrored face silhouettes), 2017 Transformers (attention eye icon), 2018 Turing Award (medal icon with three small silhouettes), 2022 ChatGPT (chat window icon), 2024 Sora (film strip icon), 2025–2026 Agents & 3D Generation (robot hand holding a 3D cube). After the last node, the timeline continues with a glowing dotted line fading into the right edge with faint ghost nodes labeled '... World Models?' and '... Robotics?' in a softer, mysterious glow — suggesting the future is unwritten. A subtle NVIDIA green glow radiates from the 2007 CUDA node forward, visually showing GPUs powering everything after it. Clean futuristic infographic style, the acceleration from sparse to dense should be visually dramatic. Dark background, neon blue and purple palette."
Save as: public/images/Evolution_of_AI.png

Speaker: Walk through FAST — point at the image as you go:
"1957: the first artificial neuron — the Perceptron. One tiny math trick.
1986: Backpropagation — the algorithm that lets networks LEARN from mistakes. 
  Hinton, Rumelhart, and Williams. Without this, nothing after it works.
1989: LeCun builds the first CNN — a network that can SEE. Reads handwritten digits.
  (pause) Notice the long gaps? Decades of slow progress. The ideas were there, 
  but the HARDWARE wasn't.
2007: NVIDIA releases CUDA — suddenly GPUs, designed for video games, 
  become the engine of AI. This is the hidden turning point most people don't know about.
2012: AlexNet — runs on NVIDIA GPUs — crushes the competition in image recognition. 
  Deep learning explodes overnight.
2014: GANs — AI learns to CREATE images, not just recognize them.
2017: The Transformer — 'Attention is All You Need.' The architecture behind everything today.
2018: Hinton, LeCun, and Bengio win the Turing Award — the Nobel Prize of computing. 
  The three 'Godfathers of AI.'
2022: ChatGPT goes viral. AI enters everyone's living room.
2024: Sora — AI generates video from text.
2025-26: Agents that use tools, 3D world generation from text.
And what's next? World models that truly understand physics? Robots that move in the real world?
Notice the pattern — decades of patience, then BOOM. We're living in the boom."
-->

---
layout: updates
---

# Your Turn! <br> AI Caricature

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

<div style="font-size: 1.4rem; line-height: 1.8; margin-bottom: 0.8rem;">

📸 You each brought a **photo of yourself**

📝 And a list of **3–5 things** that define you

</div>

<div style="background: #1e293b; padding: 0.8rem 1.5rem; border-radius: 12px; font-size: 1.2rem; margin-top: 0.5rem;">
  <p style="margin: 0 0 0.6rem 0; font-size: 1.3rem; font-weight: 700; color: #38bdf8;">How to do it:</p>
  <ol style="margin: 0; padding-left: 1.4rem; line-height: 1.5;">
    <li style="margin: 0.2rem 0; padding: 0;"><strong>Open ChatGPT</strong> on your phone</li>
    <li style="margin: 0.2rem 0; padding: 0;">Tap <strong>+</strong> on the bottom left → attach your <strong>photo</strong></li>
    <li style="margin: 0.2rem 0; padding: 0;">Paste the prompt (next slide) and <strong>fill in your traits</strong></li>
    <li style="margin: 0.2rem 0; padding: 0;">Hit <strong>Send</strong> and wait for the magic! ✨</li>
  </ol>
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

<p style="text-align: center; font-size: 1.1rem; color: #94a3b8; margin: 0.2rem 0 0.5rem;">
Open ChatGPT → tap <strong style="color: white;">+</strong> → attach photo → paste prompt → send!
</p>

<div style="display: flex; gap: 1.2rem; align-items: flex-start;">
  <div style="flex: 1;">
    <div style="background: rgba(56,189,248,0.08); border: 1px solid rgba(56,189,248,0.25); padding: 0.6rem 1rem; border-radius: 12px; font-size: 0.88rem; line-height: 1.45; color: #e0e0e0;">
      <p style="margin: 0;"><em>"Create a colorful cartoon caricature of the person in this photo. Make it fun and exaggerated with a warm friendly style. They are passionate about <strong style="color: #38bdf8;">[your trait 1]</strong>, <strong style="color: #38bdf8;">[your trait 2]</strong>, and <strong style="color: #38bdf8;">[your trait 3]</strong>. Include visual elements representing these passions floating around them. Place them on the Eilat promenade with the Red Sea in the background."</em></p>
    </div>

<p style="font-size: 1.3rem; margin-top: 0.6rem; text-align: center;">
⏱️ <strong>You have 8 minutes — go!</strong>
<br><span style="color: #94a3b8; font-size: 1.05rem;">Share with us when you're done!</span>
</p>
  </div>
  <div style="text-align: center; flex-shrink: 0;">
    <img :src="'/images/caricature_prompt_qr.png'" style="width: 160px; border-radius: 8px;" />
    <p style="font-size: 0.85rem; color: #94a3b8; margin-top: 0.3rem;">Scan to copy the prompt</p>
  </div>
</div>

<!--
Speaker: Walk around and help people. 
"Don't want to type? Scan the QR code — it copies the prompt for you. Just fill in YOUR traits."
For those without smartphones, pair them with a neighbor.
After ~8 min: "Show your neighbors! Beautiful. You are all AI artists now."
-->

---

# Here's What Happened to Me 😄

<div style="display: flex; justify-content: center; gap: 2rem; margin-top: 1rem; align-items: center;">
  <div style="text-align: center;">
    <div style="font-size: 0.95rem; color: #94a3b8; margin-bottom: 0.5rem;">📷 Original</div>
    <img :src="'/images/Itzik_ben_shabat_protrait.jpg'" style="width: 240px; height: 240px; border-radius: 12px; object-fit: cover; box-shadow: 0 4px 20px rgba(0,0,0,0.5);" />
  </div>
  <div style="display: flex; flex-direction: column; align-items: center; gap: 0.5rem;">
    <svg width="32" height="32" viewBox="0 0 41 41" fill="none"><path d="M37.532 16.87a9.963 9.963 0 0 0-.856-8.184 10.078 10.078 0 0 0-10.855-4.835A9.964 9.964 0 0 0 18.306.5a10.079 10.079 0 0 0-9.614 6.977 9.967 9.967 0 0 0-6.664 4.834 10.08 10.08 0 0 0 1.24 11.817 9.965 9.965 0 0 0 .856 8.185 10.079 10.079 0 0 0 10.855 4.835 9.965 9.965 0 0 0 7.516 3.35 10.078 10.078 0 0 0 9.617-6.981 9.967 9.967 0 0 0 6.663-4.834 10.079 10.079 0 0 0-1.243-11.813ZM22.498 37.886a7.474 7.474 0 0 1-4.799-1.735c.061-.033.168-.091.237-.134l7.964-4.6a1.294 1.294 0 0 0 .655-1.134V19.054l3.366 1.944a.12.12 0 0 1 .066.092v9.299a7.505 7.505 0 0 1-7.49 7.496ZM6.392 31.006a7.471 7.471 0 0 1-.894-5.023c.06.036.162.099.237.141l7.964 4.6a1.297 1.297 0 0 0 1.308 0l9.724-5.614v3.888a.12.12 0 0 1-.048.103l-8.051 4.649a7.504 7.504 0 0 1-10.24-2.744ZM4.297 13.62A7.469 7.469 0 0 1 8.2 10.333c0 .068-.004.19-.004.274v9.201a1.294 1.294 0 0 0 .654 1.132l9.723 5.614-3.366 1.944a.12.12 0 0 1-.114.012L7.044 23.86a7.504 7.504 0 0 1-2.747-10.24Zm27.658 6.437-9.724-5.615 3.367-1.943a.12.12 0 0 1 .113-.012l8.051 4.649a7.497 7.497 0 0 1-1.158 13.528v-9.476a1.293 1.293 0 0 0-.649-1.131Zm3.35-5.043c-.059-.037-.162-.099-.236-.141l-7.965-4.6a1.298 1.298 0 0 0-1.308 0l-9.723 5.614v-3.888a.12.12 0 0 1 .048-.103l8.05-4.645a7.497 7.497 0 0 1 11.135 7.763Zm-21.063 6.929-3.367-1.944a.12.12 0 0 1-.065-.092v-9.299a7.497 7.497 0 0 1 12.293-5.756 6.94 6.94 0 0 0-.236.134l-7.965 4.6a1.294 1.294 0 0 0-.654 1.132l-.006 11.225Zm1.829-3.943 4.33-2.501 4.332 2.5v5l-4.331 2.5-4.331-2.5V18Z" fill="#ffffff"/></svg>
    <span style="font-size: 3rem; color: white; font-weight: 700; line-height: 1;">→</span>
  </div>
  <div style="text-align: center;">
    <div style="font-size: 0.95rem; color: #94a3b8; margin-bottom: 0.5rem;">🎨 AI Caricature <span style="font-size: 0.75rem;"></span></div>
    <div class="caricature-reveal">
      <img :src="'/images/caricature_itzik.png'" style="width: 240px; height: 240px; border-radius: 12px; object-fit: cover; box-shadow: 0 4px 20px rgba(0,0,0,0.5);" />
      <div class="caricature-overlay">
        <p class="caricature-prompt-text">Create a colorful cartoon caricature of the person in this photo. Make it fun and exaggerated with a warm friendly style. They are passionate about volleyball, AI, teaching, and research. Include visual elements representing these passions floating around them. Place them on the Eilat promenade with the Red Sea in the background.</p>
      </div>
    </div>
  </div>
</div>

<p style="text-align: center; font-size: 1.3rem; color: #ccc; margin-top: 1rem;">
And yes, ChatGPT insists this is the Eilat promenade... 🏖️<br>
</p>

<style>
.caricature-reveal {
  position: relative;
  overflow: hidden;
  border-radius: 12px;
  display: inline-block;
}
.caricature-overlay {
  position: absolute;
  inset: 0;
  background: rgba(0, 0, 0, 0.88);
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0.8rem;
  opacity: 0;
  transition: opacity 0.3s ease;
  border-radius: 12px;
  overflow-y: auto;
}
.caricature-reveal:hover .caricature-overlay {
  opacity: 1;
}
.caricature-prompt-text {
  color: #e0e0e0 !important;
  font-size: 0.6rem !important;
  line-height: 1.35 !important;
  text-align: left;
  font-family: 'Courier New', monospace;
  margin: 0 !important;
}
</style>

<!--
Speaker: Show your own caricature result side-by-side. Hover over the caricature to reveal the prompt.
"Here's what happened when I tried it with my photo and traits — volleyball, AI, teaching, and research.
Not bad, right? Now imagine doing this with your grandkids tonight!"
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
layout: figure
media: /images/bio_vs_ai_neuron.png
---

# Biological Neuron vs AI Neuron

<div style="position: absolute; bottom: 2rem; left: 0; right: 0; text-align: center; z-index: 10; line-height: 1.5;">
  <span style="font-size: 1.25rem; color: #ccc;">Signals come in through <strong style="color: #f59e0b;">dendrites</strong> → the <strong style="color: #f59e0b;">cell body</strong> decides → output fires through the <strong style="color: #f59e0b;">axon</strong></span>
  <br>
  <span style="font-size: 1rem; color: #888; font-style: italic;">vs</span>
  <br>
  <span style="font-size: 1.25rem; color: #ccc;">Inputs × <strong style="color: #38bdf8;">weights</strong> → sum → output. The weights are learned from <strong style="color: #38bdf8;">data</strong>.</span>
</div>

<!--
Speaker: "Let's peek behind the curtain. Your brain is made of about 86 billion neurons.
Each one is incredibly simple: it receives signals through its dendrites,
the cell body decides if there's enough signal to care about,
and if yes — it fires a signal out through the axon to the next neurons.
Receive, decide, send. That's thinking.

In 1957, someone asked: can we build one of these in math?
The answer is the Perceptron — the artificial neuron.
Inputs come in — just numbers. Each input has a WEIGHT — how important is it?
Multiply, add them up, and decide: fire or not.
The magic? Those weights start random — totally wrong.
But you show it DATA — thousands of examples — and it adjusts the weights
until it gets the right answers. That's LEARNING.
One neuron isn't very smart. But what if we stack millions of them?"
-->

---
layout: figure
media: /images/neural_network.png
---

# Stack Them: A Neural Network

<p style="position: absolute; bottom: 2.5rem; left: 0; right: 0; text-align: center; font-size: 1.3rem; color: #ccc; z-index: 10;">
  Layers of neurons, each one learning a different pattern. <strong style="color: #38bdf8;">Billions of weights</strong> — all learned from data.
</p>

<!--
🎨 GEMINI IMAGE PROMPT:
"A wide illustration on a dark background showing two visual worlds blending into each other. On the LEFT, a warm golden-toned artistic rendering of the human brain's interior — dense clusters of biological neurons with glowing dendrites and axons forming intricate webs, signal pulses traveling through them, organic and alive, almost like a glowing coral reef. On the RIGHT, a cool blue-toned artificial neural network — clean columns of glowing nodes connected by thin luminous lines of varying brightness (representing learned weights), structured and geometric, with labels 'INPUT', 'HIDDEN LAYERS', 'OUTPUT'. In the CENTER, the two worlds gently merge — organic tendrils on the left transition into geometric connections on the right, suggesting inspiration rather than exact equivalence. A faint '≈' symbol floats where the two styles blend. A small annotation at the bottom reads 'Each connection = a learned weight. GPT-4 has ~1.8 trillion.' Left side warm amber/gold palette, right side cool blue palette. The feeling should be: nature inspired the math, not nature equals the math. Clean futuristic infographic style, sense of wonder."
Save as: public/images/neural_network.png

Speaker: "Now stack millions of these neurons in layers — that's a neural network.
Each layer learns something different. The first layer might learn simple edges and shapes.
The next layer combines those into features — eyes, noses, expressions.
Deeper layers understand concepts — style, mood, composition.
Every connection between neurons has a weight — and ALL of them are learned from data.
GPT-4? About 1.8 TRILLION weights. All learned. None programmed by hand.
Now let's see how this actually made your caricature..."
-->

---

# How It Made Your Caricature

<div style="display: flex; justify-content: center; align-items: center; margin-top: 0.5rem;">
  <div style="display: flex; align-items: center; gap: 0.8rem;">
    <div style="background: #1e293b; padding: 1rem 1.2rem; border-radius: 12px; text-align: center; min-width: 100px;">
      <div style="font-size: 2rem;">📸</div>
      <p style="color: #ccc; font-size: 0.85rem; margin: 0.3rem 0 0;">Your photo</p>
    </div>
    <span style="font-size: 1.5rem; color: #38bdf8;">→</span>
    <div style="background: #1e293b; padding: 1rem 1.2rem; border-radius: 12px; text-align: center; min-width: 100px;">
      <div style="font-size: 2rem;">📝</div>
      <p style="color: #ccc; font-size: 0.85rem; margin: 0.3rem 0 0;">Your prompt</p>
    </div>
    <span style="font-size: 1.5rem; color: #38bdf8;">→</span>
    <div style="background: linear-gradient(135deg, #1e3a5f, #1e293b); padding: 1rem 1.2rem; border-radius: 12px; text-align: center; min-width: 140px; border: 1px solid rgba(56,189,248,0.3);">
      <div style="font-size: 2rem;">🧠</div>
      <p style="color: #38bdf8; font-size: 0.85rem; margin: 0.3rem 0 0; font-weight: 600;">Neural network<br><span style="font-size: 0.75rem; color: #94a3b8;">billions of weights</span></p>
    </div>
    <span style="font-size: 1.5rem; color: #38bdf8;">→</span>
    <div style="background: #1e293b; padding: 1rem 1.2rem; border-radius: 12px; text-align: center; min-width: 100px;">
      <div style="font-size: 2rem;">🎨</div>
      <p style="color: #ccc; font-size: 0.85rem; margin: 0.3rem 0 0;">Caricature!</p>
    </div>
  </div>
</div>

<div style="margin-top: 1.2rem; padding: 0 2rem;">
  <div style="display: flex; gap: 1rem;">
    <div style="flex: 1; background: rgba(56,189,248,0.05); border: 1px solid rgba(56,189,248,0.15); border-radius: 10px; padding: 0.8rem 1rem;">
      <p style="margin: 0; font-size: 1rem; color: #ccc; line-height: 1.6;">
        <strong style="color: #38bdf8;">1.</strong> The network <strong>sees</strong> your face — detects features, proportions, expression
      </p>
    </div>
    <div style="flex: 1; background: rgba(56,189,248,0.05); border: 1px solid rgba(56,189,248,0.15); border-radius: 10px; padding: 0.8rem 1rem;">
      <p style="margin: 0; font-size: 1rem; color: #ccc; line-height: 1.6;">
        <strong style="color: #38bdf8;">2.</strong> It <strong>reads</strong> your prompt — understands "cartoon", "exaggerated", your traits
      </p>
    </div>
  </div>
  <div style="display: flex; gap: 1rem; margin-top: 0.6rem;">
    <div style="flex: 1; background: rgba(56,189,248,0.05); border: 1px solid rgba(56,189,248,0.15); border-radius: 10px; padding: 0.8rem 1rem;">
      <p style="margin: 0; font-size: 1rem; color: #ccc; line-height: 1.6;">
        <strong style="color: #38bdf8;">3.</strong> It <strong>generates</strong> the image pixel by pixel — guided by everything it learned from millions of images
      </p>
    </div>
    <div style="flex: 1; background: rgba(56,189,248,0.05); border: 1px solid rgba(56,189,248,0.15); border-radius: 10px; padding: 0.8rem 1rem;">
      <p style="margin: 0; font-size: 1rem; color: #ccc; line-height: 1.6;">
        <strong style="color: #38bdf8;">4.</strong> <strong>You directed it</strong> — it can't create without your instructions
      </p>
    </div>
  </div>
</div>

<!--
Speaker: "So what actually happened when you made that caricature?
Your photo went in. Your prompt went in. Together they hit a massive neural network —
billions of weights, all learned from millions of images and text.
Step 1: it analyzed your face — where are the eyes, the nose, what's your expression.
Step 2: it read your words — 'cartoon', 'exaggerated', 'volleyball', 'Eilat promenade'.
Step 3: it generated a brand new image, pixel by pixel, combining everything it learned
about faces, cartoon styles, and your specific instructions.
Step 4: none of this happens without YOU. You chose the photo. You wrote the traits.
You pressed send. The network is the brush — you are still the artist."
-->

<!-- COMMENTED OUT — AI Agents slide (feels unnecessary for now)
To restore: uncomment and add slide separator (three dashes) before and after.

Content: Agent = AI + Tools, "very fast intern with a small toolbox"
Punchline: "That ChatGPT you just used? It had a camera tool and a drawing tool."
Speaker notes: Agents are just AI connected to tools. Take away the tools, it can't do anything.
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
      <span style="color: #94a3b8; font-size: 1.1rem;">8-16 lines. Rhymes welcome!</span>
    </p>
  </div>
</div>

<!--
Speaker: "Left side of the room — you're builders. Right side — poets.
Builders: grab the Lego bricks from the bags. Build your team a mascot.
Any shape, animal, creature — surprise me.
Poets: grab paper and pens. Write 8-16 lines. A team anthem. It can be funny,
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

---

<div style="display: flex; justify-content: center; align-items: center; height: 80%; flex-direction: column;">
  <p style="font-size: 1.2rem; color: #94a3b8; margin-bottom: 1.5rem; font-style: italic;">
    "What is the most important thing kids today should learn?"
  </p>
  <h1 style="font-size: 4.5rem; font-weight: 900; background: linear-gradient(135deg, #38bdf8, #a78bfa); -webkit-background-clip: text; -webkit-text-fill-color: transparent; text-align: center; margin-bottom: 1.5rem;">
    Critical Thinking.
  </h1>
  <p style="font-size: 1.4rem; color: #ccc; text-align: center; max-width: 700px; line-height: 1.7;">
    We are about to be <strong style="color: white;">swamped with information</strong> — some real, some fake.<br><br>
    AI will simplify many things in our lives.<br>
    What will make us stand out is <strong style="color: #38bdf8;">how we think</strong>.
  </p>
</div>

<!--
🥚 EASTER EGG SLIDE — hidden after the final slide.
Only shown if someone in the audience asks "What should kids learn?"

Speaker: "We'll be drowning in content — text, images, video — and much of it 
will be generated by AI. Some brilliant. Some nonsense. Some dangerous.
The skill that matters most isn't coding or prompt engineering. 
It's the ability to THINK — to question, to evaluate, to reason.
AI makes answers cheap. Thinking makes answers valuable."
-->
