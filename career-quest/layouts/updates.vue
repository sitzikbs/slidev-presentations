<!-- Clean black section divider (overrides the theme's patterned one; still drives the section dots). -->
<template>
  <div class="slidev-layout updates cq-section">
    <slot />
  </div>
</template>

<style>
.slidev-layout.updates.cq-section {
  background: #000 !important;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
  padding: 3rem 4rem;
  height: 100%;
}
.slidev-layout.updates.cq-section h1 {
  font-size: 4.5rem;
  font-weight: 800;
  margin: 0 0 1rem 0;
}
</style>
