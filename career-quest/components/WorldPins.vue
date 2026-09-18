<script setup>
// Offline world map (bundled land outlines) with pins that pop in one by one.
import { computed, ref } from 'vue'
import { onSlideEnter, useSlideContext } from '@slidev/client'
import { geoNaturalEarth1, geoPath } from 'd3-geo'
import { feature } from 'topojson-client'
import land from 'world-atlas/land-110m.json'

const props = defineProps({
  // [{ name, lon, lat, kind?, left?, dy? }]  (dy nudges a label up/down to untangle clusters)
  // kind: 'home' = lived there (ring), 'team' = where collaborators are from (small, appears at click `teamAt`),
  // default = travelled there. left = put the label on the left side of the dot.
  pins: { type: Array, required: true },
  teamAt: { type: Number, default: 1 },
})

const W = 1000
const H = 500
const projection = geoNaturalEarth1().fitSize([W, H], { type: 'Sphere' })
const landPath = geoPath(projection)(feature(land, land.objects.land))

const placed = computed(() =>
  props.pins.map((p) => {
    const [x, y] = projection([p.lon, p.lat])
    return { ...p, x, y }
  }),
)

const { $clicks } = useSlideContext()
const showTeam = computed(() => $clicks.value >= props.teamAt)

// Restart the pop-in animation every time the slide is entered.
const run = ref(0)
onSlideEnter(() => run.value++)
</script>

<template>
  <div class="world-wrap">
    <svg :key="run" class="world-pins" :viewBox="`0 0 ${W} ${H}`">
    <path :d="landPath" class="land" />
    <g
      v-for="(p, i) in placed"
      :key="p.name"
      class="pin"
      :class="[p.kind || 'trip', { hidden: p.kind === 'team' && !showTeam }]"
      :style="{ animationDelay: p.kind === 'team' ? '0s' : `${0.3 + i * 0.25}s` }"
    >
      <circle :cx="p.x" :cy="p.y" :r="p.kind === 'home' ? 9 : p.kind === 'team' ? 4.5 : 6" />
      <text :x="p.x + (p.left ? -13 : 13)" :y="p.y + 6 + (p.dy || 0)" :text-anchor="p.left ? 'end' : 'start'">{{ p.name }}</text>
    </g>
  </svg>
  <div class="legend">
    <span><i class="ring" /> lived</span>
    <span><i class="dot" /> flew there for science</span>
    <span :class="{ off: !showTeam }"><i class="dot small" /> teammates come from</span>
    </div>
  </div>
</template>

<style scoped>
.world-pins {
  width: 100%;
  height: 100%;
}
.land {
  fill: rgba(255, 255, 255, 0.13);
  stroke: rgba(255, 255, 255, 0.3);
  stroke-width: 0.6;
}
.pin {
  opacity: 0;
  animation: pop 0.5s ease forwards;
}
.pin circle {
  fill: #fff;
}
.pin.home circle {
  fill: #000;
  stroke: #fff;
  stroke-width: 4;
}
.pin text {
  fill: #fff;
  font-size: 18px;
  font-weight: 700;
}
.pin.team circle {
  fill: rgba(255, 255, 255, 0.65);
}
.pin.team text {
  fill: rgba(255, 255, 255, 0.65);
  font-size: 14px;
  font-weight: 600;
}
.pin.hidden {
  display: none;
}
.world-wrap {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
}
.world-wrap svg {
  flex: 1;
  min-height: 0;
}
.legend {
  display: flex;
  justify-content: center;
  gap: 2rem;
  font-size: 1rem;
  font-weight: 700;
  color: #fff;
}
.legend span {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  transition: opacity 0.4s ease;
}
.legend span.off {
  opacity: 0.15;
}
.legend i {
  display: inline-block;
  border-radius: 50%;
}
.legend .ring {
  width: 12px;
  height: 12px;
  border: 3px solid #fff;
}
.legend .dot {
  width: 10px;
  height: 10px;
  background: #fff;
}
.legend .dot.small {
  width: 7px;
  height: 7px;
  background: rgba(255, 255, 255, 0.65);
}
@keyframes pop {
  from { opacity: 0; transform: translateY(-14px); }
  to { opacity: 1; transform: translateY(0); }
}
</style>
