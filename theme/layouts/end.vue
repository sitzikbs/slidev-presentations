<script setup>
import backgroundUrl from '../assets/background.jpg'
</script>

<template>
  <div class="slidev-layout end">
    <div class="my-background" :style="{ backgroundImage: `url(${backgroundUrl})` }"></div>
    
    <div class="end-content">
      <slot />
    </div>
  </div>
</template>

<style>
.slidev-layout.end {
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

.end-content {
  z-index: 1;
  max-width: 800px;
}

/* Typography overrides for End layout */
.slidev-layout.end h1 {
  font-size: 4rem;
  font-weight: 900;
  margin-bottom: 2rem;
  line-height: 1.1;
  color: #ffffff;
}

.slidev-layout.end p {
  font-size: 1.75rem;
  color: #e0e0e0;
  margin-bottom: 3rem;
  font-weight: 400;
}

/* Presenter info at end */
.slidev-layout.end .presenter-info {
  font-size: 1.2rem;
  color: #ffffff;
  margin-top: 2rem;
  font-weight: 400;
}

.slidev-layout.end a {
  color: #38bdf8; /* Bright Sky Blue */
  text-decoration: none;
  border-bottom: 1px dashed #38bdf8;
  transition: all 0.2s;
  font-weight: 600; /* Make it bolder to stand out */
}

.slidev-layout.end a:hover {
  color: #ffffff;
  border-bottom-style: solid;
}
</style>

