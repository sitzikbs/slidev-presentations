<script setup>
// The career "game map": a winding path with one node per level.
// `level` lights the path up to that node. `compact` renders a small strip for level slides.
import { computed } from 'vue'

const props = defineProps({
  level: { type: Number, default: 0 },
  compact: { type: Boolean, default: false },
})

const levels = [
  { icon: '⚙️', name: 'Machines' },
  { icon: '🎖️', name: 'Military' },
  { icon: '🎓', name: 'Side quest: AI' },
  { icon: '🦘', name: 'Australia' },
  { icon: '🔬', name: 'Researcher' },
  { icon: '🎮', name: 'Roblox' },
]

// Evenly spaced zigzag so every path segment has the same length.
const nodes = levels.map((l, i) => ({ ...l, x: 100 + i * 160, y: i % 2 === 0 ? 290 : 130 }))

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

const litSegments = computed(() => Math.max(0, Math.min(props.level, nodes.length) - 1))
</script>

<template>
  <div class="level-map" :class="{ compact }">
    <svg viewBox="0 0 1000 420" preserveAspectRatio="xMidYMid meet">
      <path :d="path" class="trail" />
      <path
        :d="path"
        class="trail lit"
        :pathLength="nodes.length - 1"
        :style="{ strokeDasharray: `${litSegments} ${nodes.length}` }"
      />
      <g v-for="(n, i) in nodes" :key="i" :class="{ done: i + 1 <= level, current: i + 1 === level }">
        <circle :cx="n.x" :cy="n.y" r="46" class="node" />
        <text :x="n.x" :y="n.y + 16" class="icon" text-anchor="middle">{{ n.icon }}</text>
        <text :x="n.x" :y="n.y + (i % 2 === 0 ? 92 : -66)" class="label" text-anchor="middle">
          {{ n.name }}
        </text>
        <text :x="n.x" :y="n.y + (i % 2 === 0 ? 120 : -94)" class="sublabel" text-anchor="middle">
          LEVEL {{ i + 1 }}
        </text>
      </g>
    </svg>
  </div>
</template>

<style scoped>
.level-map {
  width: 100%;
  max-width: 820px;
  margin: 0 auto;
}
.level-map svg {
  width: 100%;
  height: auto;
  overflow: visible;
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
  stroke-width: 8;
  transition: stroke-dasharray 0.8s ease;
}
.node {
  fill: #000;
  stroke: rgba(255, 255, 255, 0.3);
  stroke-width: 4;
  transition: all 0.5s ease;
}
.icon {
  font-size: 44px;
  opacity: 0.3;
  transition: opacity 0.5s ease;
}
.label {
  fill: rgba(255, 255, 255, 0.35);
  font-size: 26px;
  font-weight: 800;
}
.sublabel {
  fill: rgba(255, 255, 255, 0.25);
  font-size: 15px;
  font-weight: 700;
  letter-spacing: 0.18em;
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
  fill: rgba(255, 255, 255, 0.6);
}
.current .node {
  fill: #fff;
  animation: pulse 1.8s ease-in-out infinite;
}
@keyframes pulse {
  0%, 100% { stroke-width: 4; }
  50% { stroke-width: 14; stroke: rgba(255, 255, 255, 0.45); }
}

/* Compact strip pinned to the bottom of a level slide */
.level-map.compact {
  position: absolute;
  left: 50%;
  bottom: 0.6rem;
  width: 38%;
  transform: translateX(-50%);
  pointer-events: none;
}
.compact .label,
.compact .sublabel {
  display: none;
}
</style>
