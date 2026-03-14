<script setup>
import logoUrl from '../assets/RBLX_Wordmark_White.svg'
import tiltLogoUrl from '../assets/RBLX_Tilt_Secondary_White.svg'
</script>

<template>
  <div class="slidev-layout content">
    <!-- Tilt Logo - Top Left -->
    <div style="position: absolute; top: 2.25rem; left: 1rem; z-index: 1000; opacity: 0.8; pointer-events: none;">
      <img 
        :src="tiltLogoUrl" 
        alt="Roblox Tilt" 
        style="height: 2rem; width: auto; display: block;" 
      />
    </div>
    
    <!-- Content Slot -->
    <div class="slide-content-wrapper">
      <slot />
    </div>
  </div>
</template>

<style>
.slidev-layout.content {
  background-color: #000000 !important;
  background-image: none !important;
  padding: 0.5rem 6rem 2rem 6rem; /* Reduced from 1.5rem to 0.5rem */
  height: 100%;
  width: 100%;
  position: relative;
}

/* Typography */
.slidev-layout.content h1 {
  font-size: 2.5rem;
  font-weight: 700;
  margin-bottom: 2rem;
  margin-top: 1.5rem;
  line-height: 1.1;
  color: #ffffff;
}

.slidev-layout.content h2 {
  font-size: 2rem;
  font-weight: 600;
  margin-bottom: 1rem;
  margin-top: 1.5rem;
  color: #ffffff;
}

.slidev-layout.content h3 {
  font-size: 1.75rem;
  font-weight: 600;
  margin-bottom: 0.5rem;
  margin-top: 1rem;
  color: #e0e0e0;
}

.slidev-layout.content p,
.slidev-layout.content ul,
.slidev-layout.content ol {
  font-size: 1.5rem;
  line-height: 1.6;
  color: #ffffff;
}

.slidev-layout.content li {
  margin-bottom: 1rem;
}
</style>
