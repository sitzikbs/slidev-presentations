<script setup>
import logoUrl from '../assets/RBLX_Wordmark_White.svg'
import tiltLogoUrl from '../assets/RBLX_Tilt_Secondary_White.svg'
</script>

<template>
  <div class="slidev-layout default">
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
.slidev-layout.default {
  background-color: #000000 !important;
  background-image: none !important;
  padding: 0.5rem 6rem 2rem 6rem; /* Reduced from 1.5rem to 0.5rem */
  height: 100%;
  width: 100%;
  position: relative;
}

/* Typography */
.slidev-layout.default h1 {
  font-size: 2.5rem;
  font-weight: 700;
  margin-bottom: 2rem;
  margin-top: 1.5rem;
  line-height: 1.1;
  color: #ffffff;
}

.slidev-layout.default h2 {
  font-size: 2rem;
  font-weight: 600;
  margin-bottom: 1rem;
  margin-top: 1.5rem;
  color: #ffffff;
}

.slidev-layout.default h3 {
  font-size: 1.75rem;
  font-weight: 600;
  margin-bottom: 0.5rem;
  margin-top: 1rem;
  color: #e0e0e0;
}

.slidev-layout.default p,
.slidev-layout.default ul,
.slidev-layout.default ol {
  font-size: 1.5rem;
  line-height: 1.6;
  color: #ffffff;
}

/* FORCE BULLETS IN DEFAULT LAYOUT */
.slidev-layout.default ul {
  list-style-type: disc !important;
  list-style-position: outside !important;
  padding-left: 2.5rem !important;
  margin-left: 0 !important;
}

.slidev-layout.default ul ul {
  list-style-type: circle !important;
  padding-left: 2rem !important;
}

.slidev-layout.default ol {
  list-style-type: decimal !important;
  list-style-position: outside !important;
  padding-left: 2.5rem !important;
}

.slidev-layout.default li {
  margin-bottom: 1rem;
  display: list-item !important;
  color: #ffffff !important;
}

.slidev-layout.default li::marker {
  color: #ffffff !important;
}

/* Medium text for dense content */
.slidev-layout.default .medium-text,
.slidev-layout.default .medium-text p,
.slidev-layout.default .medium-text ul,
.slidev-layout.default .medium-text ol {
  font-size: 1.25rem !important;
  line-height: 1.5 !important;
}

.slidev-layout.default .medium-text li {
  font-size: 1.25rem !important;
  margin-bottom: 0.6rem !important;
  line-height: 1.5 !important;
}

.slidev-layout.default .medium-text a {
  color: #38bdf8 !important;
  text-decoration: underline !important;
  font-weight: 600 !important;
}

.slidev-layout.default .medium-text a:hover {
  color: #7dd3fc !important;
}
</style>
