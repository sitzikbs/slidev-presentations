<template>
  <div 
    class="global-page-number"
    :class="{ 'right-aligned': $slidev.nav.currentLayout === 'media-grid' }"
    v-if="!['cover', 'updates'].includes($slidev.nav.currentLayout)"
  >
    {{ $slidev.nav.currentPage }} / {{ $slidev.nav.total }}
  </div>
</template>

<style>
.global-page-number {
  position: absolute;
  bottom: 1rem;
  left: 50%;
  transform: translateX(-50%);
  z-index: 1000;
  font-size: 0.9rem;
  color: rgba(255, 255, 255, 0.4);
  font-family: 'Inter', sans-serif;
  pointer-events: none;
}

/* Move to bottom-right for media-grid layout */
.global-page-number.right-aligned {
  left: auto;
  right: 1.5rem;
  transform: none;
}
</style>
