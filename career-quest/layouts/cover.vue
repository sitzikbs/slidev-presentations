<!-- Clean black cover (overrides the theme's patterned cover). -->
<template>
  <div class="slidev-layout cover cq-cover">
    <slot />
  </div>
</template>

<style>
.slidev-layout.cover.cq-cover {
  background: #000 !important;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: flex-start;
  padding: 4rem 6rem;
  height: 100%;
}
.slidev-layout.cover.cq-cover h1 {
  font-size: 5.5rem;
  font-weight: 800;
  line-height: 1;
  margin: 0;
}
</style>
