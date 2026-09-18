<!-- One stop on the career map. Frontmatter: `level: 1..7`. Left slot = words, `::right::` = visual. -->
<script setup>
import { stops } from '../stops'
</script>

<template>
  <div class="slidev-layout cq-level">
    <div class="cq-level-words">
      <div class="cq-level-tag">
        <component :is="stops[$frontmatter.level - 1].icon" />
        <span>{{ stops[$frontmatter.level - 1].name }}</span>
        <span class="cq-level-place">{{ stops[$frontmatter.level - 1].place }}</span>
      </div>
      <slot />
    </div>
    <div class="cq-level-visual">
      <slot name="right" />
    </div>
    <LevelMap :level="$frontmatter.level" compact />
  </div>
</template>

<style>
.slidev-layout.cq-level {
  background: #000 !important;
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 2.5rem;
  align-items: center;
  padding: 3rem 4rem 7rem 4rem;
  height: 100%;
}
.cq-level-tag {
  display: inline-flex;
  align-items: center;
  gap: 0.55rem;
  padding: 0.35rem 0.9rem;
  margin-bottom: 1.1rem;
  border-radius: 8px;
  background: #fff;
  color: #000;
  font-size: 1rem;
  font-weight: 800;
  letter-spacing: 0.16em;
  text-transform: uppercase;
}
.cq-level-place {
  padding-left: 0.6rem;
  border-left: 2px solid rgba(0, 0, 0, 0.25);
  font-weight: 600;
  opacity: 0.6;
}
.cq-level-visual {
  height: 100%;
  min-height: 0;
  display: flex;
  align-items: center;
  justify-content: center;
}
.slidev-layout.cq-level h1 {
  font-size: 2.9rem;
  line-height: 1.08;
  margin-bottom: 0.4rem;
}
</style>
