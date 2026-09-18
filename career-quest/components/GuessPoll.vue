<script setup>
// Show-of-hands guessing beat. Options show first; the answer lights up at click `revealAt`.
// The slide needs `clicks: 1` (or more) in its frontmatter.
import { computed } from 'vue'
import { useSlideContext } from '@slidev/client'

const props = defineProps({
  options: { type: Array, required: true },
  answer: { type: Number, required: true },
  revealAt: { type: Number, default: 1 },
})

const { $clicks } = useSlideContext()
const revealed = computed(() => $clicks.value >= props.revealAt)
const letters = ['A', 'B', 'C', 'D']
</script>

<template>
  <div class="guess-poll" :class="{ revealed }">
    <div
      v-for="(option, i) in options"
      :key="i"
      class="guess-option"
      :class="{ correct: revealed && i === answer, wrong: revealed && i !== answer }"
    >
      <span class="guess-letter">{{ letters[i] }}</span>
      <span class="guess-text">{{ option }}</span>
    </div>
  </div>
</template>

<style scoped>
.guess-poll {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 1rem;
  width: 100%;
}
.guess-option {
  display: flex;
  align-items: center;
  gap: 1rem;
  padding: 1.1rem 1.4rem;
  border: 2px solid rgba(255, 255, 255, 0.35);
  border-radius: 14px;
  font-size: 1.6rem;
  font-weight: 700;
  color: #fff;
  transition: all 0.45s ease;
}
.guess-letter {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 2.4rem;
  height: 2.4rem;
  flex-shrink: 0;
  border-radius: 8px;
  background: #fff;
  color: #000;
  font-weight: 800;
}
.guess-option.correct {
  background: #fff;
  color: #000;
  border-color: #fff;
  transform: scale(1.04);
}
.guess-option.correct .guess-letter {
  background: #000;
  color: #fff;
}
.guess-option.wrong {
  opacity: 0.22;
}
</style>
