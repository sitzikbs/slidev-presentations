<script setup>
import { computed, ref, watch } from 'vue'

// Check if a slide is a section divider (updates or cover layout)
const isSectionSlide = (slideNo) => {
  const slide = $slidev.nav.slides[slideNo - 1]
  if (!slide) return false
  const layout = slide.frontmatter?.layout || slide.meta?.layout
  const slideClass = slide.frontmatter?.class || slide.meta?.class
  return layout === 'updates' || layout === 'cover' || slideClass === 'cover' || slideClass === 'updates'
}

// Build section structure: group slides by sections
const sections = computed(() => {
  const result = []
  let currentSection = null
  
  for (let i = 1; i <= $slidev.nav.total; i++) {
    if (isSectionSlide(i)) {
      // Start a new section
      if (currentSection) {
        result.push(currentSection)
      }
      currentSection = {
        sectionSlide: i,
        slides: [i]
      }
    } else if (currentSection) {
      // Add to current section
      currentSection.slides.push(i)
    } else {
      // Slides before first section - treat first slide as the section marker
      currentSection = {
        sectionSlide: i,  // Use first slide as section marker instead of null
        slides: [i]
      }
    }
  }
  
  // Push the last section
  if (currentSection) {
    result.push(currentSection)
  }
  
  return result
})

// State management for collapsed sections
const collapsedSections = ref(new Set())

// Budget: maximum number of visible slide dots (conservative to prevent overflow)
const MAX_VISIBLE_DOTS = 35

// Calculate how many dots are currently visible
const countVisibleDots = () => {
  let count = 0
  sections.value.forEach((section, index) => {
    if (shouldExpandSection(index)) {
      count += section.slides.length
    } else {
      // Collapsed section shows only the section dot
      count += 1
    }
  })
  return count
}

// Determine which sections should be expanded
const shouldExpandSection = (sectionIndex) => {
  const totalSections = sections.value.length
  const section = sections.value[sectionIndex]
  
  // Always expand last 2 sections
  if (sectionIndex >= totalSections - 2) {
    return true
  }
  
  // Always expand sections with only 1 slide
  if (section && section.slides.length <= 1) {
    return true
  }
  
  // Expand if current slide is in this section
  const isCurrentInSection = section.slides.includes($slidev.nav.currentPage)
  if (isCurrentInSection) {
    return true
  }
  
  // Otherwise check if manually expanded
  return !collapsedSections.value.has(sectionIndex)
}

// Enforce budget: collapse oldest expanded sections if over budget
const enforceBudget = () => {
  const totalSections = sections.value.length
  
  while (countVisibleDots() > MAX_VISIBLE_DOTS) {
    // Find oldest expanded section that can be collapsed
    let oldestExpandableIndex = -1
    
    for (let i = 0; i < totalSections - 2; i++) {
      const section = sections.value[i]
      const isCurrentSection = section.slides.includes($slidev.nav.currentPage)
      
      // Can collapse if: not current section and not already collapsed
      if (!isCurrentSection && !collapsedSections.value.has(i)) {
        oldestExpandableIndex = i
        break
      }
    }
    
    if (oldestExpandableIndex === -1) {
      // No more sections can be collapsed
      break
    }
    
    // Collapse the oldest expanded section
    const newCollapsed = new Set(collapsedSections.value)
    newCollapsed.add(oldestExpandableIndex)
    collapsedSections.value = newCollapsed
  }
}

// Initialize collapsed state: collapse all except last 2
const initializeCollapsedState = () => {
  const totalSections = sections.value.length
  const newCollapsed = new Set()
  
  for (let i = 0; i < totalSections - 2; i++) {
    newCollapsed.add(i)
  }
  
  collapsedSections.value = newCollapsed
}

// Initialize on mount
initializeCollapsedState()

// Enforce budget after initialization
watch(sections, () => {
  enforceBudget()
}, { immediate: true })

// Auto-expand section when navigating to a collapsed section
watch(() => $slidev.nav.currentPage, (newPage) => {
  // First, enforce budget to make room
  enforceBudget()
  
  sections.value.forEach((section, index) => {
    if (section.slides.includes(newPage)) {
      // Remove from collapsed set if present
      if (collapsedSections.value.has(index)) {
        const newCollapsed = new Set(collapsedSections.value)
        newCollapsed.delete(index)
        collapsedSections.value = newCollapsed
      }
    }
  })
  
  // Enforce budget again after expansion
  enforceBudget()
})

// Navigate to a section (used when clicking collapsed line)
const navigateToSection = (sectionIndex) => {
  // Enforce budget BEFORE navigating (which will expand the section)
  enforceBudget()
  
  const section = sections.value[sectionIndex]
  if (section && section.slides.length > 0) {
    $slidev.nav.go(section.slides[0])
  }
}

// Click section dot: navigate to section and expand it
const clickSectionDot = (sectionIndex) => {
  const totalSections = sections.value.length
  
  // Enforce budget first
  enforceBudget()
  
  // Expand the section if collapsed
  if (collapsedSections.value.has(sectionIndex)) {
    const newCollapsed = new Set(collapsedSections.value)
    newCollapsed.delete(sectionIndex)
    collapsedSections.value = newCollapsed
  }
  
  // Navigate to the section start
  const section = sections.value[sectionIndex]
  if (section && section.slides.length > 0) {
    $slidev.nav.go(section.slides[0])
  }
  
  // Enforce budget again after expansion
  enforceBudget()
}

// Check if section should be collapsible (more than 1 slide)
const isCollapsibleSection = (sectionIndex) => {
  const section = sections.value[sectionIndex]
  const totalSections = sections.value.length
  
  // Don't collapse if it's one of the last 2 sections
  if (sectionIndex >= totalSections - 2) {
    return false
  }
  
  // Don't collapse if section has only 1 slide (just the section marker)
  if (section && section.slides.length <= 1) {
    return false
  }
  
  return true
}
</script>

<template>
  <div class="global-progress-bar">
    <div class="progress-dots-container">
      <template v-for="(section, sectionIndex) in sections" :key="`section-${sectionIndex}`">
        <template v-for="(slideNo, slideIndex) in section.slides" :key="`slide-${slideNo}`">
          <!-- Only render if section is expanded OR this is the section slide -->
          <template v-if="shouldExpandSection(sectionIndex) || slideNo === section.sectionSlide">
            <!-- The Dot -->
            <div 
              class="progress-dot"
              :class="{ 
                active: slideNo === $slidev.nav.currentPage, 
                past: slideNo < $slidev.nav.currentPage,
                section: isSectionSlide(slideNo),
                collapsible: isSectionSlide(slideNo) && isCollapsibleSection(sectionIndex)
              }"
              @click="isSectionSlide(slideNo) ? clickSectionDot(sectionIndex) : $slidev.nav.go(slideNo)"
              :title="isSectionSlide(slideNo) ? `Go to section start` : `Go to slide ${slideNo}`"
            ></div>
            
            <!-- The Line -->
            <!-- Show line if: not last slide in section OR section is collapsed (skip to next section) -->
            <div 
              v-if="slideIndex < section.slides.length - 1 || sectionIndex < sections.length - 1"
              class="progress-line-segment"
              :class="{
                'section-line': !shouldExpandSection(sectionIndex) && slideNo === section.sectionSlide,
                'clickable': !shouldExpandSection(sectionIndex) && slideNo === section.sectionSlide
              }"
              @click="!shouldExpandSection(sectionIndex) && slideNo === section.sectionSlide ? navigateToSection(sectionIndex) : null"
              :title="!shouldExpandSection(sectionIndex) && slideNo === section.sectionSlide ? 'Click to go to section start' : ''"
            ></div>
          </template>
        </template>
      </template>
    </div>
  </div>
</template>

<style>
.global-progress-bar {
  position: fixed;
  top: 8px;
  left: 0;
  right: 0;
  height: 12px;
  z-index: 1000;
  pointer-events: none;
  display: flex;
  justify-content: center;
  align-items: center;
}

.progress-dots-container {
  display: flex;
  align-items: center;
  pointer-events: auto;
  transition: all 0.3s ease;
}

.progress-line-segment {
  width: 12px;
  height: 1px;
  background-color: rgba(255, 255, 255, 0.15);
  transition: all 0.3s ease;
}

/* Longer line for collapsed sections - dotted to show it's collapsed */
.progress-line-segment.section-line {
  width: 32px;
  height: 2px;
  background-image: radial-gradient(circle, rgba(255, 255, 255, 0.4) 1px, transparent 1px);
  background-size: 4px 2px;
  background-repeat: repeat-x;
  background-position: center;
}

/* Make collapsed section line clickable */
.progress-line-segment.clickable {
  cursor: pointer;
}

.progress-line-segment.clickable:hover {
  background-image: radial-gradient(circle, rgba(255, 255, 255, 0.7) 1px, transparent 1px);
  background-size: 4px 2px;
  transform: scaleX(1.1);
}

.progress-dot {
  width: 4px;
  height: 4px;
  border-radius: 50%;
  background-color: rgba(255, 255, 255, 0.3);
  cursor: pointer;
  transition: all 0.3s ease;
  border: 2px solid transparent;
  box-sizing: content-box;
  flex-shrink: 0;
}

/* Section divider dots (updates/cover layouts) - larger */
.progress-dot.section {
  width: 8px;
  height: 8px;
  background-color: rgba(255, 255, 255, 0.25);
  border: 1px solid rgba(255, 255, 255, 0.4);
  transition: all 0.3s ease;
}

/* Collapsible section dots have special hover effect */
.progress-dot.section.collapsible {
  cursor: pointer;
}

.progress-dot.section.collapsible:hover {
  background-color: rgba(255, 255, 255, 0.5);
  border-color: rgba(255, 255, 255, 0.8);
  transform: scale(1.3);
  box-shadow: 0 0 8px rgba(255, 255, 255, 0.3);
}

.progress-dot.section.collapsible::after {
  content: '';
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 20px;
  height: 20px;
  border-radius: 50%;
  background: radial-gradient(circle, rgba(255, 255, 255, 0.1) 0%, transparent 70%);
  opacity: 0;
  transition: opacity 0.3s ease;
  pointer-events: none;
}

.progress-dot.section.collapsible:hover::after {
  opacity: 1;
}

.progress-dot.section.past {
  background-color: rgba(255, 255, 255, 0.6);
  border-color: rgba(255, 255, 255, 0.7);
}

.progress-dot.section.active {
  background-color: #ffffff;
  border-color: #ffffff;
  box-shadow: 0 0 8px rgba(255, 255, 255, 0.5);
}

.progress-dot:not(.section):hover {
  background-color: rgba(255, 255, 255, 0.8);
  transform: scale(1.2);
}

/* Past slides */
.progress-dot.past {
  background-color: rgba(255, 255, 255, 0.5);
}

/* Current active slide */
.progress-dot.active {
  background-color: #ffffff;
  transform: scale(1.4);
  box-shadow: 0 0 6px rgba(255, 255, 255, 0.5);
}

/* Smooth entry/exit animations */
@keyframes dotFadeIn {
  from {
    opacity: 0;
    transform: scale(0);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}

.progress-dot {
  animation: dotFadeIn 0.2s ease;
}
</style>
