<script setup lang="ts">
import DriveMedia from '../components/DriveMedia.vue'
import tiltLogoUrl from '../assets/RBLX_Tilt_Secondary_White.svg'

const props = defineProps({
  media: {
    type: String,
    required: true,
  },
  caption: {
    type: String,
    default: '',
  },
  type: {
    type: String,
    default: 'image', // 'image' | 'video'
  },
  fit: {
    type: String,
    default: 'contain',
  },
})
</script>

<template>
  <div class="slidev-layout figure">
    <!-- Tilt Logo - Top Left -->
    <div style="position: absolute; top: 2.25rem; left: 1rem; z-index: 1000; opacity: 0.8; pointer-events: none;">
      <img 
        :src="tiltLogoUrl" 
        alt="Roblox Tilt" 
        style="height: 2rem; width: auto; display: block;" 
      />
    </div>

    <!-- Title Slot (Standard Header) -->
    <div class="figure-header">
      <slot />
    </div>

    <div class="figure-media-container">
      <DriveMedia :media="media" :type="type" :fit="fit" />
    </div>
    
    <div v-if="caption" class="figure-caption">
      {{ caption }}
    </div>
  </div>
</template>

<style>
.slidev-layout.figure {
  background-color: #000000 !important;
  padding: 2rem 4rem; /* Standard padding */
  height: 100%;
  display: flex;
  flex-direction: column;
}

.figure-header {
  margin-bottom: 1rem;
}

.figure-header h1 {
  font-size: 2.2rem; /* Slightly smaller than default */
  font-weight: 700;
  margin-bottom: 0.5rem;
}

.figure-media-container {
  flex: 1;
  width: 80%; /* Limit to 80% width for more compact display */
  max-height: 65%; /* Cap height to leave room for title/caption */
  margin: 0 auto; /* Center it */
  min-height: 0; /* Allow flex shrink */
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #000;
  border-radius: 8px;
  overflow: hidden;
}

.figure-caption {
  margin-top: 0.5rem;
  text-align: center;
  color: #9ca3af; /* Grey caption */
  font-size: 1rem;
  font-style: italic;
}
</style>

