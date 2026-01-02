<template>
  <v-sheet
    class="hero"
  >
    <div class="hero-content">
      <h1 class="hero-header">{{ title }}</h1>
      <p>
      <mark>Dealboxxed</mark> scans your Gmail promotions for deals, compiles them into a <b>weekly email digest</b>, and automatically archives everything. Never miss a good deal. Don’t drown in promos.
      </p>
     </div>
    <EarlyAccess @banner-message="passthruEvent"/>
    <FeatureGrid />
  </v-sheet>
</template>

<script setup lang="ts">
  import EarlyAccess from './EarlyAccess.vue';
  import FeatureGrid from './FeatureGrid.vue';
defineProps({
  msg: { type: String, required: true },
  title: { type: String, required: true },
})

const emit = defineEmits<{
  'banner-message': [message: string, type: string]
}>()

const passthruEvent = (message:string, type: string) => { 
  emit('banner-message', message, type);
}
</script>

<style scoped>
.hero {
  background: linear-gradient(135deg, hsl(4 70% 55% / .1), hsl(165 55% 45% / .1), hsl(210 70% 50% / .1));
}

.hero {
  display: flex;
  align-items: center;
  flex-direction: column;
  justify-content: center;
  width: 100%;
}

.hero-content {
  max-width: 800px;
  width: 100%;
  padding: 2rem;
  
  p {
    font-size: 1.25em;
    line-height: 1.75rem;
    text-align: center;
    color: var(--muted-text-color)
  }


}

.hero-header {
  font-size: 3.5rem;
  margin-bottom: 2rem;
  width: 100%;
  text-align:center;
}
</style>
