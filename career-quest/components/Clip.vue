<script setup>
// Looping muted video bundled in public/clips. `invert` flips white-background renders to black.
defineProps({
  src: { type: String, required: true },
  invert: { type: Boolean, default: false },
})
const base = import.meta.env.BASE_URL
</script>

<template>
  <video class="clip" :class="{ invert }" :src="base + src.replace(/^\//, '')" autoplay loop muted playsinline />
</template>

<style scoped>
.clip {
  width: 100%;
  height: 100%;
  object-fit: contain;
  border-radius: 14px;
}
.clip.invert {
  filter: invert(1) hue-rotate(180deg) contrast(1.15);
  mix-blend-mode: screen;
}
</style>
