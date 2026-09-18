<script setup>
// Ten experiment tiles: at click `revealAt`, nine flip to a miss and one to a hit.
import { computed } from 'vue'
import { useSlideContext } from '@slidev/client'

const props = defineProps({
  hit: { type: Number, default: 7 },
  revealAt: { type: Number, default: 1 },
})

const { $clicks } = useSlideContext()
const revealed = computed(() => $clicks.value >= props.revealAt)
</script>

<template>
  <div class="ten-tries" :class="{ revealed }">
    <div
      v-for="i in 10"
      :key="i"
      class="try"
      :class="{ hit: i === hit }"
      :style="{ transitionDelay: revealed ? `${i * 0.12}s` : '0s' }"
    >
      <span class="idea">💡</span>
      <span class="result">{{ i === hit ? '✓' : '✗' }}</span>
    </div>
  </div>
</template>

<style scoped>
.ten-tries {
  display: grid;
  grid-template-columns: repeat(10, 1fr);
  gap: 0.7rem;
  width: 100%;
}
.try {
  position: relative;
  aspect-ratio: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  border: 2px solid rgba(255, 255, 255, 0.4);
  border-radius: 12px;
  font-size: 2rem;
  font-weight: 800;
  transition: all 0.4s ease;
}
.result {
  display: none;
}
.revealed .idea {
  display: none;
}
.revealed .result {
  display: inline;
}
.revealed .try {
  color: rgba(255, 255, 255, 0.35);
  border-color: rgba(255, 255, 255, 0.15);
}
.revealed .try.hit {
  background: #fff;
  color: #000;
  border-color: #fff;
  transform: scale(1.18);
}
</style>
