<!-- Clean black content slide, vertically centered, with classroom-sized type. -->
<template>
  <div class="slidev-layout default cq-default">
    <slot />
  </div>
</template>

<style>
.slidev-layout.default.cq-default {
  background: #000 !important;
  display: flex;
  flex-direction: column;
  justify-content: center;
  padding: 2.5rem 5rem;
  height: 100%;
  width: 100%;
}
.slidev-layout.default.cq-default h1 {
  font-size: 3.2rem;
  font-weight: 800;
  line-height: 1.1;
  margin: 0 0 0.5rem 0;
  color: #fff;
}
</style>
