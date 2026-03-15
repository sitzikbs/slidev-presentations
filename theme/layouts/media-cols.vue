<script setup lang="ts">
import DriveMedia from '../components/DriveMedia.vue'

const props = defineProps({
  media: {
    type: String,
    required: true,
  },
  type: {
    type: String,
    default: 'image',
  },
  position: {
    type: String,
    default: 'right', // 'left' | 'right'
  },
  width: {
    type: String,
    default: '50%',
  },
  fit: {
    type: String,
    default: 'contain', // Default to 'contain' for scientific plots
  },
})
</script>

<template>
  <div class="slidev-layout media-cols" :class="{ 'reverse': position === 'left' }">
    <div class="media-content">
      <slot />
    </div>
    
    <div class="media-side" :style="{ width: width }">
      <DriveMedia :media="media" :type="type" :fit="fit" />
    </div>
  </div>
</template>

<style>
.slidev-layout.media-cols {
  display: flex;
  height: 100%;
  width: 100%;
  padding: 0 !important; /* Reset padding to allow full bleed */
  background-color: #000000;
}

.slidev-layout.media-cols.reverse {
  flex-direction: row-reverse;
}

.media-content {
  flex: 1;
  padding: 2rem 4rem 4rem 4rem;
  display: flex;
  flex-direction: column;
  justify-content: flex-start; /* Align to top instead of center */
  color: white;
}

/* Typography adjust for split layout */
.media-content h1 {
  font-size: 2.5rem;
  font-weight: 700;
  margin-bottom: 1.5rem;
  line-height: 1.1;
}

.media-content p,
.media-content ul,
.media-content ol {
  font-size: 1.5rem !important;
  line-height: 1.8;
}

/* FORCE BULLETS IN MEDIA-COLS LAYOUT */
.slidev-layout.media-cols ul {
  list-style-type: disc !important;
  list-style-position: outside !important;
  padding-left: 2.5rem !important;
  margin-left: 0 !important;
}

.slidev-layout.media-cols ul ul {
  list-style-type: circle !important;
  padding-left: 2rem !important;
}

.slidev-layout.media-cols ol {
  list-style-type: decimal !important;
  list-style-position: outside !important;
  padding-left: 2.5rem !important;
}

.slidev-layout.media-cols li {
  margin-bottom: 1rem;
  display: list-item !important;
  color: #ffffff !important;
}

.slidev-layout.media-cols li::marker {
  color: #ffffff !important;
}

/* Medium text for dense content in media-cols */
.slidev-layout.media-cols .medium-text,
.slidev-layout.media-cols .medium-text p,
.slidev-layout.media-cols .medium-text ul,
.slidev-layout.media-cols .medium-text ol {
  font-size: 1.25rem !important;
  line-height: 1.5 !important;
}

.slidev-layout.media-cols .medium-text li {
  font-size: 1.25rem !important;
  margin-bottom: 0.6rem !important;
  line-height: 1.5 !important;
}

.media-side {
  height: 100%;
  background-color: #000;
  padding: 2rem; /* Add padding so video doesn't fill entire space */
  display: flex;
  align-items: center; /* Center vertically */
  justify-content: center; /* Center horizontally */
}
</style>

