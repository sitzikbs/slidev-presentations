<script setup>
import backgroundUrl from '../assets/background.jpg'
</script>

<template>
  <div class="slidev-layout cover">
    <div class="my-background" :style="{ backgroundImage: `url(${backgroundUrl})` }"></div>
    <slot></slot>
  </div>
</template>

<style>
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
}

/* Cover layout specific styles */
.slidev-layout.cover {
  display: flex;
  flex-direction: column;
  justify-content: center; /* Vertically center the main content */
  align-items: flex-start; /* Left align the main content */
  text-align: left;
  padding: 4rem 6rem;
  height: 100%;
  position: relative;
}

.slidev-layout.cover h1 {
  font-size: 3.5rem;
  font-weight: 800;
  margin: 0.5rem 0 0 0;
  line-height: 1.1;
  max-width: 90%;
  text-align: left;
}

/* Date info */
.date-info {
  font-size: 1.25rem;
  color: #cccccc;
  margin-bottom: 0;
  font-weight: 500;
  letter-spacing: 0.05em;
  opacity: 0.8;
  text-align: left;
}

/* Presenter info */
.presenter-info {
  font-size: 1.5rem;
  color: #ffffff;
  margin-top: 1.5rem;
  font-weight: 400;
  opacity: 1;
  text-align: center;
  width: 100%;
  align-self: center; /* Override parent's flex-start */
}
</style>
