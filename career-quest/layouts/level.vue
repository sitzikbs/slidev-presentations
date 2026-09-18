<!-- One stop on the career map. Frontmatter: `level: 1..6`. Left slot = words, `::right::` = visual. -->
<template>
  <div class="slidev-layout cq-level">
    <div class="cq-level-words">
      <div class="cq-level-tag">LEVEL {{ $frontmatter.level }}</div>
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
  display: inline-block;
  padding: 0.3rem 0.9rem;
  margin-bottom: 1.2rem;
  border-radius: 8px;
  background: #fff;
  color: #000;
  font-size: 1rem;
  font-weight: 800;
  letter-spacing: 0.2em;
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
