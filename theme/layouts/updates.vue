<script setup>
import backgroundUrl from '../assets/background.svg'
import logoUrl from '../assets/RBLX_Wordmark_White.svg'
</script>

<template>
  <div class="slidev-layout updates">
    <div class="my-background" :style="{ backgroundImage: `url(${backgroundUrl})` }"></div>
    
    <div class="updates-content">
      <slot />
    </div>

    <div class="logo-container-left">
      <img :src="logoUrl" class="logo" alt="Roblox" />
    </div>
  </div>
</template>

<style>
.slidev-layout.updates {
  background-color: #000000 !important;
  color: #ffffff;
  height: 100%;
  width: 100%;
  position: relative;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
}

.my-background {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
  z-index: -1;
  opacity: 0.5;
}

.updates-content {
  max-width: 800px;
  z-index: 1;
}

/* Logo positioning for Updates layout (Bottom Left) */
.logo-container-left {
  position: absolute;
  bottom: 2rem;
  left: 2rem;
  z-index: 10;
  opacity: 1;
}

.logo-container-left .logo {
  height: 1.5rem;
  width: auto;
}

/* Typography overrides for Updates layout */
.slidev-layout.updates h1 {
  font-size: 4rem;
  font-weight: 900;
  margin-bottom: 1rem;
  line-height: 1.1;
  color: #ffffff;
  text-transform: uppercase;
  letter-spacing: 0.05em;
}

.slidev-layout.updates p {
  font-size: 1.5rem;
  color: #cccccc;
  margin-top: 1rem;
  font-weight: 300;
}

/* Specific class for the date if used */
.slidev-layout.updates .update-date {
  font-size: 2rem;
  font-weight: 600;
  color: #9ca3af;
  margin-bottom: 1.5rem;
  display: block;
}

/* Presenter info for Updates layout */
.slidev-layout.updates .presenter-info {
  font-size: 1.2rem;
  color: #ffffff; /* White */
  margin-top: 3rem;
  font-weight: 400; /* Regular weight */
  text-transform: none; /* No caps */
  letter-spacing: normal;
}
</style>
