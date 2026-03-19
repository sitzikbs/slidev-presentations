<script setup lang="ts">
import { computed } from 'vue'

const props = defineProps({
  media: {
    type: String,
    required: true,
  },
  type: {
    type: String,
    default: 'image', // 'image' | 'video'
  },
  fit: {
    type: String,
    default: 'contain',
  },
})

// Helper to check if string is likely a Drive ID (alphanumeric + - _ and ~20-40 chars)
const isDriveId = (str: string) => /^[a-zA-Z0-9_-]{20,}$/.test(str)

const srcUrl = computed(() => {
  const url = props.media
  
  // Check for Drive URL patterns
  const driveMatch = url.match(/\/d\/([a-zA-Z0-9_-]+)/) || url.match(/id=([a-zA-Z0-9_-]+)/)
  
  if (driveMatch) {
    const id = driveMatch[1]
    return props.type === 'video' 
      ? `https://drive.google.com/file/d/${id}/preview?hd=1` 
      : `https://drive.google.com/uc?export=view&id=${id}`
  }
  
  // Check if it's a direct ID passed
  if (isDriveId(url)) {
    return props.type === 'video' 
      ? `https://drive.google.com/file/d/${url}/preview?hd=1` 
      : `https://drive.google.com/uc?export=view&id=${url}`
  }

  // Local path — prepend Vite base URL so sub-path deployments work
  if (url.startsWith('/')) {
    return import.meta.env.BASE_URL + url.slice(1)
  }

  return url
})

const isIframe = computed(() => {
  // Use iframe if it's a Drive video OR a YouTube/Vimeo link (future proofing)
  return props.type === 'video' && (srcUrl.value.includes('drive.google.com') || srcUrl.value.includes('youtube') || srcUrl.value.includes('vimeo'))
})
</script>

<template>
  <div class="drive-media-wrapper">
    <iframe
      v-if="isIframe"
      :src="srcUrl"
      class="drive-video"
      allow="autoplay; encrypted-media"
      frameborder="0"
      allowfullscreen
    ></iframe>
    
    <video
      v-else-if="type === 'video'"
      :src="srcUrl"
      class="drive-video"
      controls
      autoplay
      loop
      muted
    ></video>
    
    <img
      v-else
      :src="srcUrl"
      class="drive-image"
      :style="{ objectFit: fit }"
      alt="Media"
    />
  </div>
</template>

<style scoped>
.drive-media-wrapper {
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #000;
}

.drive-video {
  width: 100%;
  height: 100%;
  border: none;
}

.drive-image {
  width: 100%;
  height: 100%;
  display: block;
}
</style>
