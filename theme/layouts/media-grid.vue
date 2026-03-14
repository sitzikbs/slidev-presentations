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
  caption: {
    type: String,
    default: '',
  },
  fit: {
    type: String,
    default: 'contain',
  },
  aspect: {
    type: String,
    default: '', // e.g., '1/1' for square cells
  },
  type: {
    type: String,
    default: 'image', // 'image' | 'video'
  },
})

// When aspect is 1/1, force cover fit to fill the square cells
const effectiveFit = props.aspect === '1/1' ? 'cover' : props.fit

const getDriveLink = (idOrUrl: string) => {
  const driveMatch = idOrUrl.match(/\/d\/([a-zA-Z0-9_-]+)/) || idOrUrl.match(/id=([a-zA-Z0-9_-]+)/)
  const id = driveMatch ? driveMatch[1] : idOrUrl
  // Check if it looks like an ID
  if (/^[a-zA-Z0-9_-]{20,}$/.test(id)) {
    return `https://drive.google.com/file/d/${id}/view`
  }
  return idOrUrl
}
</script>

<template>
  <div class="slidev-layout media-grid">
    <!-- Tilt Logo - Top Left -->
    <div style="position: absolute; top: 2.25rem; left: 1rem; z-index: 1000; opacity: 0.8; pointer-events: none;">
      <img 
        :src="tiltLogoUrl" 
        alt="Roblox Tilt" 
        style="height: 2rem; width: auto; display: block;" 
      />
    </div>

    <div v-if="$slots.default" class="grid-header">
      <slot />
    </div>

    <div 
      class="grid-container" 
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
        <div class="grid-item-inner" :style="aspect ? { aspectRatio: aspect } : {}">
          <DriveMedia :media="item" :type="type" :fit="effectiveFit" />
          
          <!-- Open Link / Download Overlay -->
          <a 
            :href="getDriveLink(item)" 
            target="_blank"
            download 
            class="media-link-overlay"
            title="Download / Open original"
          >
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
              <polyline points="7 10 12 15 17 10"></polyline>
              <line x1="12" y1="15" x2="12" y2="3"></line>
            </svg>
          </a>
        </div>
      </div>
    </div>
    
    <div v-if="caption" class="grid-caption">
      {{ caption }}
    </div>
  </div>
</template>

<style>
.slidev-layout.media-grid {
  background-color: #000;
  height: 100%;
  width: 100%;
  padding: 2rem 4rem;
  display: flex;
  flex-direction: column;
}

.grid-header {
  margin-bottom: 1.5rem;
  flex-shrink: 0;
}

.grid-header h1 {
  font-size: 2rem;
  margin-bottom: 0.5rem;
}

.grid-container {
  display: grid;
  width: 75%; /* Further reduce width */
  max-width: 75%;
  margin: 0 auto; /* Center the grid */
  align-content: center;
  justify-items: center;
}

.grid-item {
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.grid-item-inner {
  width: 100%;
  overflow: hidden;
  border-radius: 8px;
  background: #1a1a1a;
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative; /* Needed for absolute positioning of overlay */
}

/* Overlay link style */
.media-link-overlay {
  position: absolute;
  top: 8px;
  right: 8px;
  background: rgba(0, 0, 0, 0.6);
  color: white;
  width: 28px;
  height: 28px;
  border-radius: 4px;
  display: flex;
  align-items: center;
  justify-content: center;
  opacity: 0;
  transition: opacity 0.2s ease;
  z-index: 10;
}

.grid-item-inner:hover .media-link-overlay {
  opacity: 1;
}

.media-link-overlay:hover {
  background: rgba(56, 189, 248, 0.8); /* Sky blue hover */
}

.grid-caption {
  margin-top: 1rem;
  text-align: center;
  color: #ccc;
  font-size: 1rem;
  flex-shrink: 0;
}
</style>
