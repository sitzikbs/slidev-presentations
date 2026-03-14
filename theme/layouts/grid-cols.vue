<script setup lang="ts">
import DriveMedia from '../components/DriveMedia.vue'
import tiltLogoUrl from '../assets/RBLX_Tilt_Secondary_White.svg'

const props = defineProps({
  media: {
    type: Array as () => string[],
    default: () => [],
  },
  cols: {
    type: [String, Number],
    default: 2,
  },
  gap: {
    type: String,
    default: '1rem',
  },
  width: {
    type: String,
    default: '65%', // Grid takes more space for better visibility
  },
  fit: {
    type: String,
    default: 'contain',
  },
})
</script>

<template>
  <div class="slidev-layout grid-cols">
    <!-- Tilt Logo - Top Left -->
    <div style="position: absolute; top: 2.25rem; left: 1rem; z-index: 1000; opacity: 0.8; pointer-events: none;">
      <img 
        :src="tiltLogoUrl" 
        alt="Roblox Tilt" 
        style="height: 2rem; width: auto; display: block;" 
      />
    </div>

    <div class="grid-text-content">
      <slot />
    </div>
    
    <div class="grid-side" :style="{ width: width }">
      <div 
        class="inner-grid"
        :style="{ 
          gridTemplateColumns: `repeat(${cols}, 1fr)`,
          gap: gap
        }"
      >
        <div 
          v-for="(item, idx) in media" 
          :key="idx" 
          class="grid-item"
        >
          <DriveMedia :media="item" type="image" :fit="fit" />
        </div>
      </div>
    </div>
  </div>
</template>

<style>
.slidev-layout.grid-cols {
  display: flex;
  height: 100%;
  width: 100%;
  padding: 0 !important;
  background-color: #000000;
}

.grid-text-content {
  flex: 1;
  padding: 4rem;
  display: flex;
  flex-direction: column;
  justify-content: flex-start; /* Align to top for title */
  padding-top: 2rem;
}

/* Typography for text side */
.grid-text-content h1 {
  font-size: 2.5rem;
  font-weight: 700;
  margin-bottom: 1.5rem;
  line-height: 1.1;
  color: white;
}

.grid-side {
  height: 100%;
  background-color: #000;
  padding: 2rem;
  display: flex;
  align-items: center;
}

.inner-grid {
  display: grid;
  width: 100%;
  /* Allow grid to take height but don't force it if items are small? 
     Actually for a grid of plots, we want them to fill the space. */
  height: 100%; 
  align-content: center;
}

.grid-item {
  position: relative;
  width: 100%;
  height: 100%;
  min-height: 0; /* Important for grid overflow */
  overflow: hidden;
}
</style>

