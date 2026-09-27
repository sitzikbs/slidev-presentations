<script setup>
// Animated 3D character viewer (skinned GLB), fully offline.
// mode="mesh": solid character. mode="dots": the same motion drawn as 3D dots.
// With `reveal`, the viewer starts as dots and turns solid once the slide reaches click `revealAt`.
import { onBeforeUnmount, onMounted, ref, watch } from 'vue'
import { onSlideEnter, onSlideLeave, useSlideContext } from '@slidev/client'
import * as THREE from 'three'
import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js'
import { OrbitControls } from 'three/addons/controls/OrbitControls.js'

const props = defineProps({
  src: { type: String, required: true },
  mode: { type: String, default: 'mesh' },
  reveal: { type: Boolean, default: false },
  revealAt: { type: Number, default: 1 },
  color: { type: String, default: '#ffffff' },
  dotStride: { type: Number, default: 3 },
  spin: { type: Boolean, default: true },
  zoom: { type: Number, default: 1 }, // >1 moves the camera closer
})

const { $clicks } = useSlideContext()
const wrap = ref(null)
const canvas = ref(null)

let renderer, scene, camera, controls, mixer, clock, raf, ro
// Bumped on every start(); a GLB load that finishes after a later stop()/start() is ignored,
// otherwise a second, un-animated body would be added to the new scene.
let generation = 0
let skinned = null
let rootBone = null
let points = null
let dotIndices = []
const tmp = new THREE.Vector3()
const rootPos = new THREE.Vector3()
const follow = new THREE.Vector3()

const showDots = () => props.mode === 'dots' || (props.reveal && $clicks.value < props.revealAt)

function applyMode() {
  if (!skinned || !points) return
  const dots = showDots()
  skinned.material.visible = !dots
  points.visible = dots
}

function updateDots() {
  if (!points || !points.visible) return
  const pos = points.geometry.attributes.position
  for (let i = 0; i < dotIndices.length; i++) {
    skinned.getVertexPosition(dotIndices[i], tmp)
    skinned.localToWorld(tmp)
    pos.setXYZ(i, tmp.x, tmp.y, tmp.z)
  }
  pos.needsUpdate = true
}

// Keep the character centered: glide the camera and its orbit target along with the hips.
function followRoot() {
  if (!rootBone) return
  rootBone.getWorldPosition(rootPos)
  follow.set(rootPos.x - controls.target.x, 0, rootPos.z - controls.target.z).multiplyScalar(0.08)
  controls.target.add(follow)
  camera.position.add(follow)
}

function resize() {
  if (!renderer || !wrap.value) return
  const w = wrap.value.clientWidth || 1
  const h = wrap.value.clientHeight || 1
  renderer.setSize(w, h, false)
  camera.aspect = w / h
  camera.updateProjectionMatrix()
}

function frame() {
  raf = requestAnimationFrame(frame)
  const dt = clock.getDelta()
  if (mixer) mixer.update(dt)
  scene.updateMatrixWorld(true)
  updateDots()
  followRoot()
  controls.update()
  renderer.render(scene, camera)
}

function start() {
  if (renderer || !canvas.value) return
  const gen = ++generation
  renderer = new THREE.WebGLRenderer({ canvas: canvas.value, antialias: true, alpha: true })
  renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))
  renderer.outputColorSpace = THREE.SRGBColorSpace
  scene = new THREE.Scene()
  clock = new THREE.Clock()

  camera = new THREE.PerspectiveCamera(40, 1, 0.05, 100)
  camera.position.set(2.0 / props.zoom, 0.95 + 0.4 / props.zoom, 2.7 / props.zoom)
  controls = new OrbitControls(camera, canvas.value)
  controls.enableDamping = true
  controls.enablePan = false
  controls.enableZoom = false
  controls.target.set(0, 0.95, 0)
  controls.maxPolarAngle = Math.PI / 2 - 0.04
  controls.autoRotate = props.spin
  controls.autoRotateSpeed = 1.6

  scene.add(new THREE.AmbientLight(0xffffff, 0.55))
  const key = new THREE.DirectionalLight(0xffffff, 1.6)
  key.position.set(5, 10, 5)
  scene.add(key)
  const fill = new THREE.DirectionalLight(0xffffff, 0.5)
  fill.position.set(-5, 6, -5)
  scene.add(fill)

  const grid = new THREE.GridHelper(12, 24, 0x444444, 0x222222)
  scene.add(grid)

  new GLTFLoader().load(import.meta.env.BASE_URL + props.src.replace(/^\//, ''), (gltf) => {
    if (!renderer || gen !== generation || skinned) return
    const root = gltf.scene
    root.traverse((o) => {
      if (!o.isSkinnedMesh) return
      skinned = o
      rootBone = o.skeleton.bones[0]
      o.geometry.computeVertexNormals()
      o.frustumCulled = false
      o.material = new THREE.MeshStandardMaterial({ color: props.color, roughness: 0.65, metalness: 0 })
    })
    scene.add(root)

    if (skinned) {
      const count = skinned.geometry.attributes.position.count
      dotIndices = []
      for (let i = 0; i < count; i += props.dotStride) dotIndices.push(i)
      const geo = new THREE.BufferGeometry()
      geo.setAttribute('position', new THREE.BufferAttribute(new Float32Array(dotIndices.length * 3), 3))
      points = new THREE.Points(geo, new THREE.PointsMaterial({ color: 0xffffff, size: 0.022, sizeAttenuation: true }))
      points.frustumCulled = false
      scene.add(points)
      applyMode()
    }
    if (gltf.animations?.length) {
      mixer = new THREE.AnimationMixer(root)
      gltf.animations.forEach((clip) => mixer.clipAction(clip).play())
    }
  })

  ro = new ResizeObserver(resize)
  ro.observe(wrap.value)
  resize()
  frame()
}

function stop() {
  generation++
  if (!renderer) return
  cancelAnimationFrame(raf)
  ro?.disconnect()
  controls?.dispose()
  scene.traverse((o) => {
    o.geometry?.dispose?.()
    o.material?.dispose?.()
  })
  renderer.dispose()
  renderer = scene = camera = controls = mixer = skinned = points = rootBone = null
}

// Only hold a WebGL context while the slide is on screen (browsers cap live contexts).
onSlideEnter(start)
onSlideLeave(stop)
onMounted(() => {
  if (wrap.value?.offsetParent !== null) start()
})
onBeforeUnmount(stop)
watch($clicks, applyMode)
</script>

<template>
  <div ref="wrap" class="motion-viewer">
    <canvas ref="canvas" />
  </div>
</template>

<style scoped>
.motion-viewer {
  width: 100%;
  height: 100%;
  min-height: 200px;
  position: relative;
}
.motion-viewer canvas {
  width: 100%;
  height: 100%;
  display: block;
  cursor: grab;
}
</style>
