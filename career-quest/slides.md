---
theme: ../theme
title: Career Quest
favicon: favicon.png
highlighter: shiki
layout: default
clicks: 2
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

<h1>What is this person doing?</h1>

<div style="display: grid; grid-template-columns: 1.2fr 1fr; gap: 2rem; align-items: center; height: 360px;">
  <div style="height: 100%; min-height: 0;"><MotionViewer src="models/Video-Games-Virtual-Reality-1.glb" /></div>
  <div>
    <GuessPoll compact :cols="1" :options="['Conducting an orchestra', 'Swatting mosquitoes', 'Playing a VR game', 'Landing a plane']" :answer="2" />
    <p v-click="2" style="margin-top: 1rem; font-size: 1.3rem;">Nobody animated this. <span class="dim">A computer watched a video and rebuilt it in 3D.</span></p>
  </div>
</div>

<!--
[0:00] THE HOOK. This is on screen, moving, while Mr. Umberger introduces you. No title, no name, no Roblox. Let them wonder.
First words out of your mouth: "Before I tell you who I am, I need your help. What is this person doing?" (You can drag to spin it.)
Hands up for A... B... C... D. Let it get loud.
CLICK 1: VR game. "Two lightsabers, slicing blocks that fly at you."
CLICK 2: "Here's the weird part. Nobody animated this. Nobody wore a special suit. A computer watched an ordinary video of a real person playing, and rebuilt the movement in 3D by itself."
"Getting computers to understand how people move is my job. And how I got that job makes no sense. Let me show you."
-->

---
clicks: 2
---

<div style="display: grid; grid-template-columns: 300px 1fr; gap: 3rem; align-items: center; height: 100%;">
  <div style="height: 300px;"><PhotoSlot src="photos/portrait.jpg" label="portrait" /></div>
  <div>
    <h1>Hi, I'm Itzik</h1>
    <p><span class="dim">Say it like</span> "Itsy" bitsy spider <span class="dim">+ k</span></p>
    <p v-click="1">Scientist at <img :src="$base + 'RBLX_Wordmark_White.svg'" style="display: inline; height: 1.6rem; vertical-align: baseline; margin-left: 0.3rem;" alt="Roblox" /></p>
    <p v-click="2">Also: somebody's dad. <lucide-hand style="display: inline; vertical-align: -0.15em;" /> <span class="dim">Hi sweetie!</span></p>
  </div>
</div>

<!--
[1:00] Name gag: "Itsy, like the spider, plus a k." Have them say it once together.
CLICK 1: "I'm a scientist at... Roblox." Pause. Let the reaction happen.
CLICK 2, the dad line. Embarrass him ON PURPOSE, big and warm, then let him off the hook fast:
 - Wave with both hands: "Hi sweetie! Did you eat the lunch I packed?"
 - "He asked me for exactly one thing today: 'Dad, please don't be weird.'" (beat) "So. Anyway."
 - Callback option for later: on the 9-out-of-10 slide, "ask him how many times I failed to fix the wifi."
(His name stays off the slide on purpose: this deck is public on the web.)
-->

---
clicks: 1
---

# So what did I study to get here?

<div style="margin-top: 2.5rem;">
  <GuessPoll :options="['Video game design', 'Computer science', 'Art and animation', 'Gears and engines']" :answer="3" />
</div>

<!--
[1:45] GUESS #2. Quick hands for each. Most will pick A or B.
CLICK: gears and engines. "Mechanical engineering. Machines. Nothing to do with games. Nothing to do with AI."
"So how does a gears guy end up at Roblox? It was not a straight line. It looked like this."
-->

---
layout: updates
transition: fade
---

# Not a straight line

<LevelMap :level="7" :from="1" />

<!--
[2:15] Let the little guy walk the whole path. "Seven stops. Three countries. And every zigzag is a moment where I changed direction."
"Here's the secret: at no point did I know what the next stop was."
Don't explain the stops. 8 seconds, then go.
-->

---
layout: level
level: 1
clicks: 1
---

# I wanted to know how things work

<p class="dim">So I studied machines</p>

<p v-click class="bridge">Then it was my turn to serve…</p>

::right::

<Clip src="clips/cad-gears.mp4" />

<!--
[2:30] ~30 sec. "As a kid I took things apart. So at university I studied mechanical engineering: how machines work and why they break."
"This is one of mine: the inside of a car's speedometer and the counter that tracks how far you've driven. Every gear, designed on a computer."
"I thought: this is it. I'll design machines forever."
CLICK the bridge: "Then it was my turn to serve. Where I grew up, everybody does."
-->

---
layout: level
level: 2
clicks: 1
---

# 4 years in the army

<p class="dim">Not like the movies. A small grey cubicle, designing machine parts.</p>

<p v-click class="bridge">Grey all day. So I went looking for colour…</p>

::right::

<PhotoSlot src="photos/level2-military.jpg" label="A military photo you're comfortable showing" />

<!--
[3:00] ~25 sec. Play the contrast for the laugh.
"I know what you're picturing. Helicopters. Explosions."
"I sat in a tiny grey cubicle. Grey walls, grey desk, grey computer. I designed mechanical parts and got them manufactured."
"But they were real parts that real people depended on. If I got it wrong, it didn't fit. That's where I learned to be careful and to finish the job."
CLICK the bridge: "Grey all day. So after work, I went looking for some colour."
-->

---
layout: level
level: 2
clicks: 1
---

# After hours: robots

<p class="dim">I volunteered to coach a high school team</p>

<p v-click class="bridge">Those kids made me want to learn more…</p>

::right::

<Clip src="clips/frc-3316.mp4" />

<!--
[3:25] ~30 sec. "The cubicle was grey. So after work, I found some colour. I volunteered as a mentor for a high school robotics team. Team 3316."
"High schoolers, not much older than you, design and build THIS in six weeks. Then they compete. That's our robot with the red bumpers, hanging tubes on the rack."
"Nobody paid me. It was the best part of my week." (There are FIRST teams for middle schoolers too, if anyone asks.)
CLICK the bridge: "Watching those kids figure things out made me want to go back and learn more myself."
-->

---
layout: level
level: 3
clicks: 1
---

# The inside of a bone

<p class="dim">Could we 3D-print a replacement?</p>

<p v-click class="bridge">To study bones, I had to teach a computer to see them…</p>

::right::

<div style="width: 100%;"><PhotoSlot src="photos/bone-structure.png" label="bone micro-structure" /></div>

<!--
[3:55] ~35 sec. "Anyone know what this is?" Take a guess or two. "It's the INSIDE of a bone, zoomed way in. It's not solid. It's a sponge. That's why bones are light AND strong."
"For my master's degree I asked: can we design and 3D-print something like this, to replace damaged bone?"
"Still a machines question. Still engineering. But..."
CLICK the bridge: "To work with a shape this complicated, the computer has to understand it first. The colours are the computer splitting the bone into pieces, by itself. And THAT part, I could not stop thinking about."
(Itzik: adjust to how it really happened. This is my reading of your master's papers.)
-->

---
layout: level
level: 4
clicks: 1
---

# Plot twist

<p class="dim">Same trick. Not bones any more: whole streets.</p>

<p v-click class="bridge">Nobody taught me this part. I had to teach myself.</p>

::right::

<div style="width: 100%;"><PhotoSlot src="photos/street-dots.png" label="street scanned as 3D dots" invert /></div>

<!--
[4:30] ~40 sec. THE turn in the story.
"The trick I built for bones worked on other 3D things too. This is a street, scanned by a laser. See the cars? The computer coloured each object by itself."
"I realised I cared more about teaching computers to see in 3D than about the bones. So for my PhD I switched: 3D vision and AI."
"I was still sitting in the machines department. My classmates were building engines. I was doing AI."
CLICK: "One problem. I'd done a little coding in high school, and two basic classes at university. That's it. AI needs WAY more than that."
"There was no class for what I needed. So I taught myself. Tutorials, other people's code, breaking things and fixing them. Most of what I use every day, nobody taught me."
Bridge out loud: "And if you want to teach ROBOTS to see, one of the best labs in the world was 15,000 kilometres away."
-->

---
layout: level
level: 5
clicks: 1
---

# What is the computer looking at?

<p class="dim">To a robot, the world is just dots</p>

::right::

<MotionViewer src="models/Sport-Skateboarding-2.glb" reveal />

<!--
[5:10] GUESS #3. "So I moved my whole family to the other side of the planet. Australia. To work with robots."
"A robot's 3D camera sees THIS. Just dots. What's happening here? Shout it out."
Let them guess (dancing? falling? surfing?). Drag to rotate it.
CLICK: dots become a person. "Skateboarding! Onto a rail and off. Your brain got that in two seconds. Teaching a computer to get it took us years."
-->

---
layout: level
level: 5
---

# Robots that help you build

<p class="dim">It watches you, and hands you the next piece</p>

::right::

<Clip src="clips/goferbot.mp4" />

<!--
[5:50] ~30 sec. "This is our lab in Australia. The robot watches a person build IKEA furniture, works out which step they're on, and hands them the next part."
"To teach it, we needed examples. LOTS of examples of people building furniture. So we filmed everyone we could find..."
-->

---
layout: level
level: 5
clicks: 2
---

# We filmed hundreds of builders

<p v-click="1">…and one dinosaur.</p>

<p v-click="2" class="bridge">AI is great at what it has seen before. This? Scientists call it <b>"out of distribution"</b>.</p>

::right::

<div style="width: 100%;"><PhotoSlot src="photos/dinosaur-ikea.jpg" label="dinosaur assembling IKEA furniture" /></div>

<!--
[6:15] ~35 sec. Let them spot it first: "Notice anything strange about this builder?"
CLICK 1. "Students. Professors. My own kids. And yes. One dinosaur."
CLICK 2. "Here's why that's actually science. AI is only good at things it has seen before. It learns from examples. And I promise you: no AI on Earth had ever seen a dinosaur build a table."
"Scientists have a name for that: OUT OF DISTRIBUTION. It means 'nothing like what I practised on.' It's the hardest test there is. Like studying for a maths test and getting a question about dinosaurs."
"Real science. Published. There is a dinosaur in our data."
Bridge out loud: "By now I had a thousand questions for other scientists. So I started asking them."
-->

---
layout: level
level: 5
clicks: 1
hide: true
---

# A tiny car that drives itself

<p class="dim">No remote control. It only follows what its camera sees.</p>

<p v-click class="bridge">I had a thousand questions for other scientists. So I started asking them…</p>

::right::

<Clip src="clips/tiny-car.mp4" />

<!--
[HIDDEN] ~20 sec. HIDDEN to save time. Delete `hide: true` in this slide's frontmatter to bring it back (+20 sec).
"At a robot summer school, my team taught this little car to drive itself around a paper road. No remote. Just a camera and what it learned."
CLICK the bridge: "By now I had a thousand questions for other scientists. So I started asking them. On a microphone."
-->

---
layout: level
level: 6
clicks: 1
---

# The world shut down

<p class="dim">No conferences. Nowhere to share discoveries.</p>

<p v-click class="bridge">So I started a podcast. Then one guest said…</p>

::right::

<div style="height: 330px; width: 100%;"><img :src="$base + 'photos/talking-papers-logo.png'" style="height: 100%; margin: 0 auto;" alt="Talking Papers Podcast" /></div>

<!--
[6:50] ~40 sec. "I won a European fellowship: money to chase my OWN questions. It started in Australia and finished back in Israel."
THE HEART OF 'WHAT IS A SCIENTIST': "In school, every question has an answer in the back of the book. My job is the questions where there IS no back of the book. Nobody on Earth knows the answer yet. You get to be the first to find out."
"Then COVID hit. Remember I said scientists fly around the world to share what they found? All of that stopped. People did years of work and had nobody to tell."
CLICK the bridge: "So I started a podcast, Talking Papers, to give scientists everywhere a place to explain their work. Just to help. I had no idea it would change my life."
-->

---
layout: level
level: 7
---

# "I'm having a great time."

<p class="dim">A podcast guest. He worked at Roblox.</p>

::right::

<div class="center-stack"><img :src="$base + 'RBLX_Tilt_Secondary_White.svg'" style="height: 200px;" alt="Roblox" /></div>

<!--
[7:30] ~30 sec. "I interviewed a scientist for my podcast. He worked at Roblox. And he told me: 'I'm having a great time.'"
"I didn't get this job because I planned it. I got it because of a hobby. Because I was curious and talked to people."
"And every stop on the map came with me: machines taught me how bodies move. Bones and streets taught me 3D. The robots taught me how computers see. None of it was wasted."
-->

---
layout: updates
---

# So what do I do all day?

<p class="dim">No, I don't play games ALL day. (Just a little.)</p>

<!--
[8:00] Section break. Get the laugh, then: "My job is to build things games can't do YET."
-->

---

# Build what games can't do yet

<div class="cards" style="grid-template-columns: repeat(4, 1fr); margin-top: 2.5rem;">
  <div v-click class="card"><span class="emoji"><lucide-gamepad-2 /></span>Play and talk to creators</div>
  <div v-click class="card"><span class="emoji"><lucide-code-xml /></span>Write code</div>
  <div v-click class="card"><span class="emoji"><lucide-flask-conical /></span>Run experiments</div>
  <div v-click class="card"><span class="emoji"><lucide-trophy /></span>Prove it to the experts</div>
</div>

<!--
[8:05] ~75 sec, one click per card.
1. "I play and I talk to the people who make games. I ask: what do you WISH you could do?"
2. "Most of my time: writing code."
3. "Then experiments. Try an idea, measure it, see if it actually works."
4. "When it works, we have to prove it to the world's top experts. They try hard to find holes in it. We have to show it's new, nobody did it before, and it's useful. If they agree, it gets published for everyone in the world to use."
(Deliberately no "paper" jargon. If you say "paper", define it as that proof.)
-->

---

# Teaching computers how people move

<div class="viewer-row" style="grid-template-columns: repeat(3, 1fr); margin-top: 1rem;">
  <div class="viewer-cell"><MotionViewer src="models/Video-Games-Rhythm-Games-0.glb" /><div class="prompt-chip">"play a guitar video game"</div></div>
  <div class="viewer-cell"><MotionViewer src="models/Dance-Ballet-2.glb" /><div class="prompt-chip">"spin like a ballet dancer"</div></div>
  <div class="viewer-cell"><MotionViewer src="models/Sport-Volleyball-0.glb" /><div class="prompt-chip">"serve a volleyball"</div></div>
</div>

<!--
[9:15] ~60 sec. "Computers have never had a body. They don't know what a jump feels like. So we show them a HUGE number of examples of real people moving, each with a description."
"These are from a collection we built. Hundreds of kinds of movement, all labeled." (You can drag to rotate.)
"Learn from enough of these and the computer can make NEW movement from just words. Imagine typing how your avatar should move."
Accuracy note for you: these are motions a computer recovered from real videos (RoMo), each with its description. They are the examples a movement-generating AI learns FROM, not generated output.
-->

---
clicks: 1
class: updates
---

# Science sends me places

<div style="height: 400px; width: 100%;">
  <WorldPins :pins="[
    { name: 'Israel', lon: 35.0, lat: 32.0, kind: 'home', left: true, dy: 14 },
    { name: 'Canberra', lon: 149.1, lat: -35.3, kind: 'home' },
    { name: 'California', lon: -122.3, lat: 37.5, kind: 'home', left: true },
    { name: 'Hawaii', lon: -155.5, lat: 19.9, left: true },
    { name: 'Vancouver', lon: -123.1, lat: 49.3, left: true },
    { name: 'Long Beach', lon: -118.2, lat: 33.8, left: true, dy: 12 },
    { name: 'Arizona', lon: -111.9, lat: 33.4, dy: -14 },
    { name: 'New Orleans', lon: -90.1, lat: 30.0, dy: 8 },
    { name: 'Madrid', lon: -3.7, lat: 40.4, left: true, dy: 12 },
    { name: 'Milan', lon: 9.2, lat: 45.5, left: true, dy: 4 },
    { name: 'Munich', lon: 11.6, lat: 48.1, dy: -8 },
    { name: 'Adelaide', lon: 138.6, lat: -34.9, left: true },
    { name: 'France', lon: 2.3, lat: 48.8, kind: 'team', left: true, dy: -16 },
    { name: 'Germany', lon: 13.4, lat: 52.5, kind: 'team', dy: -22 },
    { name: 'Italy', lon: 12.5, lat: 41.9, kind: 'team', dy: 14 },
    { name: 'Chile', lon: -70.7, lat: -33.4, kind: 'team', left: true },
    { name: 'Brazil', lon: -47.9, lat: -15.8, kind: 'team' },
    { name: 'Iran', lon: 53.0, lat: 32.5, kind: 'team' },
    { name: 'India', lon: 78.9, lat: 22.0, kind: 'team', left: true },
    { name: 'Sri Lanka', lon: 80.7, lat: 7.8, kind: 'team', left: true },
    { name: 'China', lon: 104.0, lat: 35.0, kind: 'team', left: true },
    { name: 'Korea', lon: 127.5, lat: 36.5, kind: 'team' },
    { name: 'Taiwan', lon: 121.0, lat: 23.7, kind: 'team' },
    { name: 'Singapore', lon: 103.8, lat: 1.35, kind: 'team' },
  ]" />
</div>

<!--
[10:00] ~45 sec. "When you discover something, you travel to tell other scientists about it."
"Rings: places I've lived. White dots: places my job flew me to. Hawaii counts as work. I checked."
CLICK: the blue teammate dots appear. "And these are where the people I've worked with come from. Science is a team sport, and the team is the whole planet."
Pins are a plain list in slides.md: kind 'home' = lived (ring), default = travelled, 'team' = collaborators (appear on click).
-->

---

# More perks

<div class="cards" style="grid-template-columns: repeat(3, 1fr); margin-top: 2.5rem;">
  <div class="card"><span class="emoji"><lucide-bot /></span>Cool toys: robots, 3D cameras, motion capture</div>
  <div class="card"><span class="emoji"><lucide-gamepad-2 /></span>"Testing it in Roblox" counts as work</div>
  <div class="card"><span class="emoji"><lucide-clapperboard /></span>A science show for kids <span class="dim">(coming soon)</span></div>
</div>

<!--
[10:40] ~30 sec, all three are already on screen. One sentence each, keep moving.
The kids' science show is NOT out yet: say "coming soon", and tease it ("you'll be the first to hear about it").
-->

---
layout: updates
---

# Boss Fights

<p class="dim">The hard parts</p>

<!--
[11:10] Section break. Tone shift: slower, more honest. This is the part they'll remember.
-->

---
clicks: 1
---

# How many times did the experts say "no"?

<div style="margin-top: 2.5rem;">
  <GuessPoll :options="['Never', 'Once or twice', 'About five times', 'More than I can count']" :answer="3" />
</div>

<!--
[11:15] GUESS #4. CLICK to reveal.
"More than I can count. I honestly lost track. Remember the experts who try to find holes? They usually find some. You fix it, make it better, and try again."
"Every scientist you've ever heard of has a pile of these."
-->

---
clicks: 1
---

# 10 ideas

<div style="margin-top: 2.5rem;"><TenTries /></div>

<p v-click="1" style="margin-top: 2.5rem; text-align: center;">9 out of 10 fail. <span class="dim">That's not losing. That's the job.</span></p>

<!--
[11:45] ~50 sec. "Ten ideas, ten experiments." CLICK. "About nine don't work."
"The one that works only exists because of the nine. Each failure taught me something about the problem."
"What it takes isn't being a genius. It's understanding the problem deeply, exploring, and not quitting. Same as beating a hard boss: nobody does it first try."
-->

---

# Starting over. Three times.

<div class="cards" style="grid-template-columns: repeat(3, 1fr); margin-top: 2.5rem;">
  <div class="card"><span class="emoji"><lucide-shuffle /></span>Switched fields. Taught myself the hard parts.</div>
  <div class="card"><span class="emoji"><lucide-earth /></span>Moved across the world. Twice. New language, new friends.</div>
  <div class="card"><span class="emoji"><lucide-building-2 /></span>Left the university for a company</div>
</div>

<!--
[12:30] ~40 sec. Three restarts, one sentence each, then ONE real story.
1. "I switched fields, and had to teach myself the hard parts."
2. "I moved my family across the world. Twice. New language, new friends, new everything. Anyone here ever switch schools? It's that. Scary for a while, then it's the best thing you did."
3. "And two years ago I left the university world, the only world I knew, for a company. Different rules, different speed. Beginner again."
"Every time, I was the new kid. It never stops being scary. It always ends up worth it."
-->

---

# Power-ups I collected

<div class="cards" style="grid-template-columns: repeat(5, 1fr); margin-top: 2.5rem;">
  <div class="card"><span class="emoji"><lucide-calculator /></span>Math</div>
  <div class="card"><span class="emoji"><lucide-wrench /></span>Building stuff</div>
  <div class="card"><span class="emoji"><lucide-laptop /></span>Coding<br><span class="dim" style="font-size: 1rem;">(mostly self-taught)</span></div>
  <div class="card"><span class="emoji"><lucide-megaphone /></span>Explaining ideas</div>
  <div class="card"><span class="emoji"><lucide-circle-help /></span>Asking "why?"</div>
</div>

<!--
[13:10] ~40 sec. NOT "here's what you should study". It's "here's what turned out to be useful".
"Math is how you tell a computer what you mean. Building stuff taught me how things break. Coding: I got the basics in school, but the advanced stuff I taught myself. You can too. Everything you need is online."
"Surprise one: writing and explaining. The best idea in the world is worthless if you can't convince anyone."
"And the one you already have: asking why."
-->

---
layout: updates
transition: fade
---

# When I was 13,<br>my job didn't exist.

<p v-click class="dim">I didn't know some doctors aren't <i>doctor</i> doctors.</p>
<p v-click>Yours might not exist yet either.</p>
<p v-click>So learn the hard stuff <b>now</b>. <span class="dim">If it's hard for you, it's hard for everyone. That's your edge.</span></p>

<!--
[13:40] THE CLOSE. Slow down. Three clicks, a breath between each.
"When I was 13, this job did not exist. Nobody could have told me to aim for it."
CLICK 1, the laugh: "When I was 13 I didn't even know there were doctors who aren't medical doctors. I have a PhD, so technically I'm Dr. Itzik. My grandma STILL doesn't get it. She keeps asking me about her knee."
CLICK 2: "The job you'll have might not exist yet either. So you can't plan for it exactly."
CLICK 3, the one thing to land: "Here's your best bet. Learn the hard stuff NOW. Math, coding, building things, explaining ideas. It only gets harder to learn later. I know, I had to do it the hard way."
"And here's the secret: if it's hard for you, it's hard for everybody else too. Most people quit. If you don't, that's your edge, for the rest of your life."
Then stop. Don't add anything. Let it sit for two seconds, and go to questions.
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
[14:10] Q&A, 5 to 10 minutes. The starter questions are there in case nobody wants to go first. Have your answers ready.
If it's quiet, ask THEM: "What would you build if games could do anything?"
-->
