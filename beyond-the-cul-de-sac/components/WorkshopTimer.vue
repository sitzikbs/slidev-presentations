<script setup>
import { ref, computed, onUnmounted } from 'vue'

const TOTAL = 15 * 60 // 15 minutes

const timeLeft = ref(TOTAL)
const isRunning = ref(false)
const isMusicOn = ref(false)

let timerInterval = null
let audioCtx = null
let masterGain = null
let chordTimeout = null
let chordIndex = 0

// Am – F – C – G loop, two octaves of voicing for warmth
const CHORDS = [
  [110.00, 130.81, 164.81, 220.00], // Am
  [87.307, 110.00, 130.81, 174.61], // F
  [130.81, 164.81, 196.00, 261.63], // C
  [98.000, 123.47, 146.83, 196.00], // G
]

// ── computed ────────────────────────────────────────────────
const timeDisplay = computed(() => {
  const m = Math.floor(timeLeft.value / 60).toString().padStart(2, '0')
  const s = (timeLeft.value % 60).toString().padStart(2, '0')
  return `${m}:${s}`
})

const progress = computed(() => 1 - timeLeft.value / TOTAL)

const timerColor = computed(() => {
  if (timeLeft.value === 0) return '#22c55e'
  if (timeLeft.value <= 120) return '#ef4444'
  if (timeLeft.value <= 300) return '#f59e0b'
  return '#ffffff'
})

const statusText = computed(() => {
  if (timeLeft.value === 0) return "Time's Up!"
  if (timeLeft.value <= 120) return 'Finish up!'
  if (timeLeft.value <= 300) return '5 minutes left!'
  return 'Build! Write! Create!'
})

const statusIcon = computed(() => {
  if (timeLeft.value === 0) return 'i-lucide-party-popper'
  if (timeLeft.value <= 120) return 'i-lucide-zap'
  if (timeLeft.value <= 300) return 'i-lucide-alarm-clock'
  return 'i-lucide-pencil-ruler'
})

const isStarted = computed(() => timeLeft.value < TOTAL)

const startLabel = computed(() => {
  if (isRunning.value) return 'Pause'
  if (!isStarted.value) return 'Start'
  return 'Resume'
})

const startIcon = computed(() => isRunning.value ? 'i-lucide-pause' : 'i-lucide-play')

// ── audio helpers ────────────────────────────────────────────
function ensureAudio() {
  if (!audioCtx) {
    audioCtx = new (window.AudioContext || window.webkitAudioContext)()
    masterGain = audioCtx.createGain()
    masterGain.gain.setValueAtTime(0, audioCtx.currentTime)
    masterGain.connect(audioCtx.destination)
  }
  if (audioCtx.state === 'suspended') audioCtx.resume()
}

function playChord(freqs, duration, t0) {
  freqs.forEach((freq, i) => {
    const osc = audioCtx.createOscillator()
    const gain = audioCtx.createGain()
    const filter = audioCtx.createBiquadFilter()

    osc.type = i === 0 ? 'triangle' : 'sine'
    osc.frequency.setValueAtTime(freq, t0)

    filter.type = 'lowpass'
    filter.frequency.setValueAtTime(700 - i * 50, t0)
    filter.Q.setValueAtTime(0.8, t0)

    // Soft attack / sustain / release envelope
    gain.gain.setValueAtTime(0, t0)
    gain.gain.linearRampToValueAtTime(0.22 - i * 0.03, t0 + 1.0)
    gain.gain.setValueAtTime(0.18 - i * 0.02, t0 + duration - 1.2)
    gain.gain.linearRampToValueAtTime(0, t0 + duration)

    osc.connect(filter)
    filter.connect(gain)
    gain.connect(masterGain)
    osc.start(t0)
    osc.stop(t0 + duration)
  })
}

function scheduleNextChord() {
  if (!isMusicOn.value) return
  const dur = 4.5
  playChord(CHORDS[chordIndex % CHORDS.length], dur, audioCtx.currentTime)
  chordIndex++
  chordTimeout = setTimeout(scheduleNextChord, (dur - 0.4) * 1000)
}

// ── controls ─────────────────────────────────────────────────
function toggleMusic() {
  ensureAudio()
  isMusicOn.value = !isMusicOn.value
  if (isMusicOn.value) {
    masterGain.gain.linearRampToValueAtTime(0.2, audioCtx.currentTime + 0.8)
    scheduleNextChord()
  } else {
    clearTimeout(chordTimeout)
    masterGain.gain.linearRampToValueAtTime(0, audioCtx.currentTime + 1.2)
  }
}

function toggleTimer() {
  if (timeLeft.value === 0) return
  ensureAudio()
  isRunning.value = !isRunning.value
  if (isRunning.value) {
    timerInterval = setInterval(() => {
      timeLeft.value--
      if (timeLeft.value === 0) {
        isRunning.value = false
        clearInterval(timerInterval)
      }
    }, 1000)
  } else {
    clearInterval(timerInterval)
  }
}

function resetTimer() {
  isRunning.value = false
  clearInterval(timerInterval)
  timeLeft.value = TOTAL
}

onUnmounted(() => {
  clearInterval(timerInterval)
  clearTimeout(chordTimeout)
  if (audioCtx) audioCtx.close()
})
</script>

<template>
  <div class="timer-wrap">
    <!-- progress ring -->
    <svg class="progress-ring" viewBox="0 0 220 220">
      <circle cx="110" cy="110" r="100" class="ring-bg" />
      <circle
        cx="110" cy="110" r="100"
        class="ring-fill"
        :style="{
          stroke: timerColor,
          strokeDashoffset: 628.3 * (1 - progress),
        }"
      />
    </svg>

    <!-- countdown -->
    <div class="countdown" :style="{ color: timerColor }">{{ timeDisplay }}</div>

    <!-- status -->
    <p class="status" :style="{ color: timerColor }">
      <span :class="[statusIcon, 'status-icon']" />
      {{ statusText }}
    </p>

    <!-- buttons -->
    <div class="controls">
      <button
        class="btn"
        :class="isRunning ? 'btn-red' : 'btn-green'"
        @click="toggleTimer"
      >
        <span :class="[startIcon, 'btn-icon']" />{{ startLabel }}
      </button>
      <button class="btn btn-gray" @click="resetTimer">
        <span class="i-lucide-rotate-ccw btn-icon" />Reset
      </button>
      <button
        class="btn"
        :class="isMusicOn ? 'btn-purple' : 'btn-blue'"
        @click="toggleMusic"
      >
        <span :class="[isMusicOn ? 'i-lucide-volume-x' : 'i-lucide-music', 'btn-icon']" />
        {{ isMusicOn ? 'Music Off' : 'Music On' }}
      </button>
    </div>

    <div v-if="timeLeft === 0" class="done">
      <span class="i-lucide-party-popper done-icon" />
      <span class="i-lucide-toy-brick done-icon" />
      <span class="i-lucide-pen-line done-icon" />
      <span class="i-lucide-palette done-icon" />
      <span class="i-lucide-party-popper done-icon" />
    </div>
  </div>
</template>

<style scoped>
.timer-wrap {
  position: absolute;
  inset: 0;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 1rem;
}

/* SVG progress ring */
.progress-ring {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%) rotate(-90deg);
  width: 260px;
  height: 260px;
  pointer-events: none;
}
.ring-bg {
  fill: none;
  stroke: rgba(255,255,255,0.07);
  stroke-width: 6;
}
.ring-fill {
  fill: none;
  stroke-width: 6;
  stroke-linecap: round;
  stroke-dasharray: 628.3;
  transition: stroke-dashoffset 1s linear, stroke 0.5s ease;
  filter: drop-shadow(0 0 6px currentColor);
}

.countdown {
  font-size: 6.5rem;
  font-weight: 900;
  font-family: 'Courier New', monospace;
  font-variant-numeric: tabular-nums;
  line-height: 1;
  transition: color 0.5s ease;
  text-shadow: 0 0 24px currentColor;
  position: relative;
  z-index: 1;
}

.status {
  font-size: 1.7rem;
  margin: 0;
  transition: color 0.5s ease;
  font-weight: 600;
  position: relative;
  z-index: 1;
}

.controls {
  display: flex;
  gap: 0.9rem;
  margin-top: 0.4rem;
  position: relative;
  z-index: 1;
}

.btn {
  border: none;
  border-radius: 10px;
  padding: 0.6rem 1.3rem;
  font-size: 1.05rem;
  font-weight: 700;
  cursor: pointer;
  color: white;
  transition: transform 0.1s ease, opacity 0.2s ease;
}
.btn:hover  { opacity: 0.85; transform: scale(1.05); }
.btn:active { transform: scale(0.97); }

.btn-green  { background: #22c55e; }
.btn-red    { background: #ef4444; }
.btn-gray   { background: #475569; }
.btn-blue   { background: #38bdf8; color: #0f172a; }
.btn-purple { background: #8b5cf6; }

.done {
  font-size: 2.8rem;
  position: relative;
  z-index: 1;
  display: flex;
  gap: 0.5rem;
  align-items: center;
}

.done-icon {
  display: inline-block;
  width: 2.4rem;
  height: 2.4rem;
}

.status-icon {
  display: inline-block;
  width: 1.5rem;
  height: 1.5rem;
  vertical-align: middle;
  margin-right: 0.3rem;
}

.btn-icon {
  display: inline-block;
  width: 1rem;
  height: 1rem;
  vertical-align: middle;
  margin-right: 0.3rem;
}
</style>
