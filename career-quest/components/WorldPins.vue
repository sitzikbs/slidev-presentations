<script setup>
// Offline world map (bundled land outlines) with pins that pop in one by one.
import { computed, ref } from 'vue'
import { onSlideEnter } from '@slidev/client'
import { geoNaturalEarth1, geoPath } from 'd3-geo'
import { feature } from 'topojson-client'
import land from 'world-atlas/land-110m.json'

const props = defineProps({
  // [{ name, lon, lat, home?, left? }]  home = lived there (ring), left = label on the left side
  pins: { type: Array, required: true },
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

// Restart the pop-in animation every time the slide is entered.
const run = ref(0)
onSlideEnter(() => run.value++)
</script>

<template>
  <svg :key="run" class="world-pins" :viewBox="`0 0 ${W} ${H}`">
    <path :d="landPath" class="land" />
    <g v-for="(p, i) in placed" :key="p.name" class="pin" :style="{ animationDelay: `${0.4 + i * 0.35}s` }">
      <circle :cx="p.x" :cy="p.y" :r="p.home ? 9 : 6" :class="{ home: p.home }" />
      <text :x="p.x + (p.left ? -14 : 14)" :y="p.y + 6" :text-anchor="p.left ? 'end' : 'start'">{{ p.name }}</text>
    </g>
  </svg>
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
.pin circle.home {
  fill: #000;
  stroke: #fff;
  stroke-width: 4;
}
.pin text {
  fill: #fff;
  font-size: 19px;
  font-weight: 700;
}
@keyframes pop {
  from { opacity: 0; transform: translateY(-14px); }
  to { opacity: 1; transform: translateY(0); }
}
</style>
