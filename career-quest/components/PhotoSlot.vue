<script setup>
// A photo from public/photos. Until the file exists, shows a labelled placeholder
// so it is obvious which photo still needs to be dropped in.
import { ref } from 'vue'

defineProps({
  src: { type: String, required: true },
  label: { type: String, default: 'photo' },
  invert: { type: Boolean, default: false }, // flip a white-background figure to black, keeping its colours
})
const base = import.meta.env.BASE_URL
const missing = ref(false)
</script>

<template>
  <div class="photo-slot">
    <img v-if="!missing" :class="{ invert }" :src="base + src.replace(/^\//, '')" :alt="label" @error="missing = true" />
    <div v-else class="placeholder">
      <lucide-camera class="cam" />
      <span>{{ label }}</span>
      <code>public/{{ src }}</code>
    </div>
  </div>
</template>

<style scoped>
.photo-slot {
  width: 100%;
  height: 100%;
}
.photo-slot img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 14px;
}
.placeholder {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 0.5rem;
  border: 2px dashed rgba(255, 255, 255, 0.35);
  border-radius: 14px;
  color: rgba(255, 255, 255, 0.6);
  font-size: 1.1rem;
  text-align: center;
}
.placeholder .cam {
  font-size: 2.5rem;
}
.placeholder code {
  font-size: 0.8rem;
  opacity: 0.7;
}
.photo-slot img.invert {
  filter: invert(1) hue-rotate(180deg);
}
</style>
