---
theme: ../theme
title: Career Quest
highlighter: shiki
class: cover
drawings:
  persist: false
transition: slide-left
mdc: true
head:
  meta:
    - name: 'og:title'
      content: 'Career Quest'
  script:
    - src: '/spa-redirect.js'
---

# Career<br>Quest

<p class="dim" style="margin-top: 1.5rem;">How a guy who studied gears ended up at Roblox</p>

<!--
[0:00] Title is up while Mr. Umberger introduces you. Don't talk about yourself yet.
Go straight to the game on the next slide: "Before I tell you who I am, I need your help with something."
-->

---
clicks: 1
---

# An AI made this character walk like a…

<div style="display: grid; grid-template-columns: 1fr 1.2fr; gap: 2rem; align-items: center; height: 340px;">
  <Clip src="clips/style-chicken-walk.mp4" invert />
  <GuessPoll :options="['Zombie', 'Chicken', 'Dinosaur', 'Robot']" :answer="1" />
</div>

<!--
[0:15] GUESS #1. "Hands up for A, zombie... B, chicken..." Let them be loud for 10 seconds.
CLICK to reveal: chicken.
"Nobody moved this character by hand. We told a computer 'walk like a chicken' and it figured out the rest."
"Teaching computers to do this is my actual job."
-->

---

<div style="display: grid; grid-template-columns: 300px 1fr; gap: 3rem; align-items: center; height: 100%;">
  <div style="height: 300px;"><PhotoSlot src="photos/portrait.jpg" label="portrait" /></div>
  <div>
    <h1>Hi, I'm Itzik</h1>
    <p><span class="dim">Say it like</span> "Itsy" bitsy spider <span class="dim">+ k</span></p>
    <p>Scientist at <img :src="$base + 'RBLX_Wordmark_White.svg'" style="display: inline; height: 1.6rem; vertical-align: baseline; margin-left: 0.3rem;" alt="Roblox" /></p>
  </div>
</div>

<!--
[1:00] Keep it short. Name gag: "Itsy, like the spider, plus a k." Have them say it once together.
"I grew up in Israel, lived in Australia, now I live here. I'm a scientist at Roblox."
Pause for the reaction, then: "I know. But I did NOT plan this. Let me show you."
(If your son is OK with it, mention him here. Ask him first.)
-->

---
clicks: 1
---

# What did I study first?

<div style="margin-top: 2.5rem;">
  <GuessPoll :options="['Video game design', 'Computer science', 'Art and animation', 'Gears and engines']" :answer="3" />
</div>

<!--
[1:45] GUESS #2. Quick hands for each. Most will pick A or B.
CLICK: gears and engines. "Mechanical engineering. Machines. Nothing to do with games or AI."
"So how do you get from gears to Roblox? It wasn't a straight line. It looked more like this..."
-->

---
layout: updates
transition: fade
---

# The Map

<LevelMap :level="6" />

<!--
[2:15] "Six levels. And notice, the path zigzags. Every turn is a place where I changed direction."
Don't explain the levels here, just let them look for 5 seconds. Move on.
-->

---
layout: level
level: 1
---

# I built machines

<p class="dim">Math, physics, and lots of broken prototypes</p>

::right::

<PhotoSlot src="photos/level1-machines.jpg" label="You as a student / something you built" />

<!--
[2:30] ~30 sec. "At university I learned how to design machines. How things move, why things break."
"I liked it. I thought that's what I'd do forever." (Plant: you don't have to know at 13. I didn't know at 23.)
-->

---
layout: level
level: 2
---

# 4 years of service

<p class="dim">Teamwork. Staying calm. Finishing what you start.</p>

::right::

<PhotoSlot src="photos/level2-military.jpg" label="A military photo you're comfortable showing" />

<!--
[3:00] ~25 sec. One or two sentences about what you did, in kid words.
"Where I grew up, everyone serves after high school."
The lesson: working with a team when things are hard. Then move on, don't linger.
-->

---
layout: level
level: 3
---

# A side quest<br>took over

<p class="dim">I met AI. I had to learn to code from zero.</p>

::right::

<MotionViewer src="models/Survival-Skills-Self-Defense-2.glb" mode="dots" />

<!--
[3:30] ~40 sec. "I went back to school to study more machines. Then I saw computers learning to understand 3D shapes, and I couldn't stop thinking about it."
"Problem: everyone around me already knew how to code. I was the beginner in the room. The OLD beginner."
"I was still in the machines department, doing AI. The side quest became the main quest."
(The dots on the right are a teaser for the next slide.)
-->

---
layout: level
level: 4
clicks: 1
---

# What is the computer looking at?

<p class="dim">To a computer, the world is just dots</p>

::right::

<MotionViewer src="models/Sport-Skateboarding-2.glb" reveal />

<!--
[4:10] GUESS #3. "I moved to the other side of the planet, Australia, to work on robots. A robot's 3D camera sees THIS. Just dots. What's going on here? Shout it out."
Let them guess (dancing? falling? surfing?). You can drag to rotate it.
CLICK: dots become a person. "Skateboarding! Onto a rail and off. Your brain got it in 2 seconds. Teaching a computer to get it took us years."
-->

---
layout: level
level: 4
---

# Robots that help you build

<p class="dim">It watches, and hands you the next piece</p>

::right::

<Clip src="clips/goferbot.mp4" />

<!--
[4:50] ~30 sec. "This is from our lab in Australia. The robot watches a person build IKEA furniture, understands which step they're on, and hands them the next part."
"We filmed hundreds of people building furniture so the computer could learn from examples."
-->

---
layout: level
level: 5
---

# Nobody knows<br>the answer yet

<p class="dim">You can't look it up. You get to find out first.</p>

::right::

<div class="center-stack"><span class="huge">?</span></div>

<!--
[5:20] ~40 sec. This is the heart of "what is a scientist".
"In school, every question has an answer in the back of the book. My job is the questions where there IS no back of the book. Nobody on Earth knows yet."
"As a researcher I got to pick my own questions and lead my own team to chase them."
-->

---
layout: level
level: 6
---

# Then Roblox called

<p class="dim">A machines guy. At a games company.</p>

::right::

<div class="center-stack"><img :src="$base + 'RBLX_Tilt_Secondary_White.svg'" style="height: 200px;" alt="Roblox" /></div>

<!--
[6:00] ~20 sec. "Two years ago I joined Roblox as a senior scientist."
"Every level gave me something I still use: machines taught me how bodies move, the robots taught me how computers see. None of it was wasted."
-->

---
layout: updates
---

# So what do I do all day?

<p class="dim">No, I don't play games all day. (A little.)</p>

<!--
[6:20] Section break. Get the laugh, then: "My job is to build things games can't do YET."
-->

---

# Build what games can't do yet

<div class="cards" style="grid-template-columns: repeat(4, 1fr); margin-top: 2.5rem;">
  <div v-click class="card"><span class="emoji">🎮</span>Play and talk to creators</div>
  <div v-click class="card"><span class="emoji">⌨️</span>Write code</div>
  <div v-click class="card"><span class="emoji">🧪</span>Run experiments</div>
  <div v-click class="card"><span class="emoji">🏆</span>Prove it to the experts</div>
</div>

<!--
[6:35] ~75 sec, one click per card.
1. "I play and I talk to the people who make games. I ask: what do you WISH you could do?"
2. "Most of my time: writing code."
3. "Then experiments. Try an idea, measure it, see if it actually works."
4. "When it works, we have to prove it to the world's top experts. They try hard to find holes in it. We have to show it's new, nobody did it before, and it's useful. If they agree, it gets published for everyone in the world to use."
(Deliberately no "paper" jargon. If you say "paper", define it as that proof.)
-->

---

# Type words. Get movement.

<div class="viewer-row" style="grid-template-columns: repeat(3, 1fr); margin-top: 1rem;">
  <div class="viewer-cell"><MotionViewer src="models/Video-Games-Virtual-Reality-1.glb" /><div class="prompt-chip">"swing two lightsabers"</div></div>
  <div class="viewer-cell"><MotionViewer src="models/Dance-Ballet-2.glb" /><div class="prompt-chip">"spin like a ballet dancer"</div></div>
  <div class="viewer-cell"><MotionViewer src="models/Sport-Volleyball-0.glb" /><div class="prompt-chip">"serve a volleyball"</div></div>
</div>

<!--
[7:50] ~60 sec. "Computers have never had a body. They don't know what a jump feels like. So we show them a HUGE number of examples of real people moving, each with a description."
"These are from a collection we built. Hundreds of kinds of movement, all labeled." (You can drag to rotate.)
"Learn from enough of these and the computer can make NEW movement from just words. Imagine typing how your avatar should move."
Accuracy note for you: these three are real human motions from the RoMo collection with their descriptions, i.e. the examples the AI learns FROM. The chicken earlier was AI-generated.
-->

---

# "Move like a…"

<div class="viewer-row" style="grid-template-columns: repeat(2, 1fr); height: 330px; margin-top: 1rem;">
  <div class="viewer-cell"><Clip src="clips/style-dinosaur-walk.mp4" invert /><div class="prompt-chip">dinosaur 🦖</div></div>
  <div class="viewer-cell"><Clip src="clips/style-flapping-walk.mp4" invert /><div class="prompt-chip">bird flapping its wings 🐦</div></div>
</div>

<!--
[8:50] ~30 sec, pure fun. "And once it understands movement, you can ask for silly things. Same AI as the chicken."
Optional: ask what THEY would type. Take 2 answers, max.
-->

---
layout: updates
---

# Perks

<!--
[9:20] Section break, one breath. "OK, the fun stuff."
-->

---

# Science sends me places

<div style="height: 350px;">
  <WorldPins :pins="[
    { name: 'Israel', lon: 35.0, lat: 32.8, home: true },
    { name: 'Australia', lon: 149.1, lat: -35.3, home: true },
    { name: 'California', lon: -122.3, lat: 37.5, home: true, left: true },
    { name: 'Munich', lon: 11.6, lat: 48.1 },
    { name: 'Vancouver', lon: -123.1, lat: 49.3, left: true },
    { name: 'New Orleans', lon: -90.1, lat: 30.0 },
  ]" />
</div>

<!--
[9:30] ~35 sec. "When you discover something, you travel to tell other scientists about it. Rings = places I've lived. Dots = places my job flew me to."
EDIT THE PINS in slides.md to match where you've really been (add Hawaii, Seattle, etc. if true).
-->

---

# More perks

<div class="cards" style="grid-template-columns: repeat(3, 1fr); margin-top: 2.5rem;">
  <div v-click class="card"><span class="emoji">🤖</span>Cool toys: robots, 3D cameras, motion capture</div>
  <div v-click class="card"><span class="emoji">🎙️</span>My podcast: I ask top scientists anything</div>
  <div v-click class="card"><span class="emoji">🧒</span>A science show I made for kids</div>
</div>

<!--
[10:05] ~50 sec, one click each.
1. Toys: robots, HoloLens, motion capture suits, giant computers. "Testing things in Roblox counts as work."
2. Talking Papers Podcast: "I get to call up the smartest people in my field and ask them how they did it."
3. Kids Curiosity Club.
-->

---
layout: updates
---

# Boss Fights

<p class="dim">The hard parts</p>

<!--
[10:55] Section break. Tone shift: slower, more honest. This is the part they'll remember.
-->

---
clicks: 1
---

# How many times did the experts say "no"?

<div style="margin-top: 2.5rem;">
  <GuessPoll :options="['Never', 'Once or twice', 'About five times', 'Way more than ten']" :answer="3" />
</div>

<!--
[11:05] GUESS #4. CLICK to reveal.
"Way more than ten. Remember the experts who try to find holes? They usually find some. You fix it, make it better, and try again."
TODO (Itzik): put your real number in the story. If the true answer isn't "way more than ten", change :answer in slides.md.
-->

---
clicks: 1
---

# 10 ideas

<div style="margin-top: 2.5rem;"><TenTries /></div>

<p v-click="1" style="margin-top: 2.5rem; text-align: center;">9 out of 10 fail. <span class="dim">That's not losing. That's the job.</span></p>

<!--
[11:40] ~50 sec. "Ten ideas, ten experiments." CLICK. "About nine don't work."
"The one that works only exists because of the nine. Each failure taught me something about the problem."
"What it takes isn't being a genius. It's understanding the problem deeply, exploring, and not quitting. Same as beating a hard boss: nobody does it first try."
-->

---

# Starting over. Three times.

<div class="cards" style="grid-template-columns: repeat(3, 1fr); margin-top: 2.5rem;">
  <div v-click class="card"><span class="emoji">🐣</span>The oldest beginner in the coding class</div>
  <div v-click class="card"><span class="emoji">🌏</span>Moved across the world. Twice.</div>
  <div v-click class="card"><span class="emoji">👋</span>New country, new language, new friends</div>
</div>

<!--
[12:30] ~45 sec. Tell ONE real, specific story here (a moment you felt lost in Australia, or an embarrassing beginner coding mistake). Specific beats general.
"Anyone here ever switch schools? It's that. Scary for a while, then it becomes the best thing you did."
-->

---

# Power-ups I collected

<div class="cards" style="grid-template-columns: repeat(5, 1fr); margin-top: 2.5rem;">
  <div v-click class="card"><span class="emoji">➗</span>Math</div>
  <div v-click class="card"><span class="emoji">🔧</span>Building stuff</div>
  <div v-click class="card"><span class="emoji">💻</span>Coding<br><span class="dim" style="font-size: 1rem;">(learned late!)</span></div>
  <div v-click class="card"><span class="emoji">🗣️</span>Explaining ideas</div>
  <div v-click class="card"><span class="emoji">❓</span>Asking "why?"</div>
</div>

<!--
[13:15] ~40 sec. NOT "here's what you should study". It's "here's what turned out to be useful".
"Math is how you tell a computer what you mean. Building stuff taught me how things break. Coding I learned late and it was fine."
"Surprise one: writing and explaining. The best idea in the world is worthless if you can't convince anyone."
"And the one you already have: asking why."
-->

---
layout: updates
transition: fade
---

# When I was 13,<br>my job didn't exist.

<p v-click>Yours might not exist yet either.</p>
<p v-click class="dim">The stuff you're curious about right now? That's the clue.</p>

<!--
[13:55] THE CLOSE. Slow down. Two clicks, pause between each. Then stop talking. Don't add a moral.
-->

---
layout: updates
---

# Ask me anything

<div class="cards" style="grid-template-columns: repeat(3, 1fr); margin-top: 2rem; max-width: 800px;">
  <div class="card">"Do you get free Robux?"</div>
  <div class="card">"Will AI take over?"</div>
  <div class="card">"What's the worst bug you made?"</div>
</div>

<!--
[14:15] Q&A, 5 to 10 minutes. The starter questions are there in case nobody wants to go first. Have your answers ready.
If it's quiet, ask THEM: "What would you build if games could do anything?"
-->
