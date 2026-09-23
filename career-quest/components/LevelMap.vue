<script setup>
// The career "game map": a winding path with one stop per chapter of the story.
// `level` lights the path up to that stop, and a little avatar walks there from the previous stop
// every time the slide is entered. `compact` renders the small strip used on level slides.
import { computed, nextTick, onMounted, ref } from 'vue'
import { onSlideEnter } from '@slidev/client'
import IconPlane from '~icons/lucide/plane'
import { stops } from '../stops'

const props = defineProps({
  level: { type: Number, default: 0 },
  from: { type: Number, default: null }, // stop the avatar walks in from (default: level - 1)
  compact: { type: Boolean, default: false },
})

// Evenly spaced zigzag, so every path segment has the same length.
const X0 = 120
const DX = 160
const nodes = stops.map((s, i) => ({ ...s, x: X0 + i * DX, y: i % 2 === 0 ? 340 : 200 }))

const last = nodes.length - 1
const path = computed(() => {
  let d = `M ${nodes[0].x} ${nodes[0].y}`
  for (let i = 1; i < nodes.length; i++) {
    const a = nodes[i - 1]
    const b = nodes[i]
    const mx = (a.x + b.x) / 2
    d += ` C ${mx} ${a.y}, ${mx} ${b.y}, ${b.x} ${b.y}`
  }
  return d
})

// Where in the world each stretch of the path happened.
const regions = [
  { name: 'ISRAEL', a: 0, b: 3 },
  { name: 'AUSTRALIA → ISRAEL', a: 4, b: 5 },
  { name: 'CALIFORNIA', a: 6, b: 6 },
]
// Boxes meet halfway between neighbouring stops (with a small gap), so no label can poke out of its box.
const GAP = 10
const edge = (i) => (i <= 0 ? nodes[0].x - DX / 2 : i >= nodes.length ? nodes[last].x + DX / 2 : (nodes[i - 1].x + nodes[i].x) / 2)
const regionBoxes = regions.map((r) => ({
  ...r,
  x: edge(r.a) + GAP / 2,
  w: edge(r.b + 1) - edge(r.a) - GAP,
}))
// A flight hop wherever the path crosses from one region to the next.
const flights = regions.slice(1).map((r) => ({ x: (nodes[r.a - 1].x + nodes[r.a].x) / 2 }))

const clamp = (n) => Math.max(0, Math.min(n, nodes.length))
const litSegments = computed(() => Math.max(0, clamp(props.level) - 1))

// Avatar position along the path, in percent. Starts at the previous stop, then walks to `level`.
const pct = (stop) => (Math.max(1, clamp(stop)) - 1) / last * 100
const startStop = computed(() => props.from ?? Math.max(1, props.level - 1))
const tokenAt = ref(pct(startStop.value))
const walking = ref(false)

async function walk() {
  walking.value = false
  tokenAt.value = pct(startStop.value)
  await nextTick()
  requestAnimationFrame(() =>
    requestAnimationFrame(() => {
      walking.value = true
      tokenAt.value = pct(props.level)
    }),
  )
}
onMounted(walk)
onSlideEnter(walk)
</script>

<template>
  <div class="level-map" :class="{ compact }">
    <svg viewBox="0 0 1200 480" preserveAspectRatio="xMidYMid meet">
      <g v-if="!compact" class="regions">
        <g v-for="r in regionBoxes" :key="r.name">
          <rect :x="r.x" y="40" :width="r.w" height="420" rx="28" />
          <text :x="r.x + r.w / 2" y="22" text-anchor="middle">{{ r.name }}</text>
        </g>
        <IconPlane v-for="f in flights" :key="f.x" :x="f.x - 15" y="236" width="30" height="30" class="flight" />
      </g>

      <path :d="path" class="trail" />
      <path
        :d="path"
        class="trail lit"
        :pathLength="last"
        :style="{ strokeDasharray: `${litSegments} ${nodes.length}` }"
      />

      <g v-for="(n, i) in nodes" :key="i" :class="{ done: i + 1 <= level, current: i + 1 === level }">
        <circle :cx="n.x" :cy="n.y" r="44" class="node" />
        <component :is="n.icon" :x="n.x - 23" :y="n.y - 23" width="46" height="46" class="icon" />
        <template v-if="!compact">
          <!-- Bottom-row stops: label lines run downward from the node. Top-row stops: they stack upward, sublabel on top. -->
          <text
            v-for="(line, k) in n.name.split('\n')"
            :key="k"
            :x="n.x"
            :y="i % 2 === 0 ? n.y + 80 + k * 22 : n.y - 60 - (n.name.split('\n').length - 1 - k) * 22"
            class="label"
            text-anchor="middle"
          >{{ line }}</text>
          <text
            :x="n.x"
            :y="i % 2 === 0 ? n.y + 80 + n.name.split('\n').length * 22 : n.y - 60 - n.name.split('\n').length * 22"
            class="sublabel"
            text-anchor="middle"
          >{{ n.sub }}</text>
        </template>
      </g>

      <!-- The traveller -->
      <g
        v-if="level > 0"
        class="token"
        :class="{ walking }"
        :style="{ offsetPath: `path('${path}')`, offsetDistance: `${tokenAt}%` }"
      >
        <g transform="translate(0,-58)">
          <rect x="-13" y="-40" width="26" height="24" rx="5" />
          <rect x="-17" y="-13" width="34" height="30" rx="5" />
          <rect x="-15" y="19" width="13" height="18" rx="3" />
          <rect x="2" y="19" width="13" height="18" rx="3" />
        </g>
      </g>
    </svg>
  </div>
</template>

<style scoped>
.level-map {
  width: 100%;
  max-width: 900px;
  margin: 0 auto;
}
.level-map svg {
  width: 100%;
  height: auto;
  overflow: visible;
}
.regions rect {
  fill: rgba(255, 255, 255, 0.045);
  stroke: rgba(255, 255, 255, 0.16);
  stroke-width: 2;
  stroke-dasharray: 6 8;
}
.regions text {
  fill: rgba(255, 255, 255, 0.45);
  font-size: 17px;
  font-weight: 800;
  letter-spacing: 0.25em;
}
.regions .flight {
  color: rgba(255, 255, 255, 0.55);
}
.trail {
  fill: none;
  stroke: rgba(255, 255, 255, 0.18);
  stroke-width: 8;
  stroke-linecap: round;
  stroke-dasharray: 2 18;
}
.trail.lit {
  stroke: #fff;
  transition: stroke-dasharray 1.4s ease;
}
.node {
  fill: #000;
  stroke: rgba(255, 255, 255, 0.3);
  stroke-width: 4;
  transition: all 0.5s ease;
}
.icon {
  color: #fff;
  opacity: 0.3;
  transition: opacity 0.5s ease;
}
.label {
  fill: rgba(255, 255, 255, 0.4);
  font-size: 20px;
  font-weight: 800;
}
.sublabel {
  fill: rgba(255, 255, 255, 0.3);
  font-size: 14px;
  font-weight: 600;
}
.done .node {
  stroke: #fff;
}
.done .icon {
  opacity: 1;
}
.done .label {
  fill: #fff;
}
.done .sublabel {
  fill: rgba(255, 255, 255, 0.65);
}
.current .node {
  animation: pulse 1.8s ease-in-out infinite;
}
@keyframes pulse {
  0%, 100% { stroke-width: 4; }
  50% { stroke-width: 12; stroke: rgba(255, 255, 255, 0.5); }
}

.token {
  offset-rotate: 0deg;
}
.token rect {
  fill: #fff;
  stroke: #000;
  stroke-width: 3;
}
.token.walking {
  transition: offset-distance 1.4s ease-in-out;
  animation: bob 0.35s ease-in-out 4;
}
@keyframes bob {
  0%, 100% { translate: 0 0; }
  50% { translate: 0 -7px; }
}

/* Compact strip pinned to the bottom of a level slide */
.level-map.compact {
  position: absolute;
  left: 50%;
  bottom: 0.2rem;
  width: 40%;
  transform: translateX(-50%);
  pointer-events: none;
}
.compact .token rect {
  stroke-width: 5;
}
</style>
