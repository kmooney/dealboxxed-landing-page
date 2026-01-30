<template>
  <div>
    <Hero
      title="Take control of your inbox"
      msg="Dealboxxed scans your Gmail promotions for deals, compiles them into a weekly digest, and automatically archives everything. Never miss a good deal. Never drown in promos."
      @banner-message="handleBannerMessage"
    />
    <FAQ
      @banner-message="handleBannerMessage"
    />
  </div>
</template>

<script setup lang="ts">
import Hero from '../components/Hero.vue';
import FAQ from '../components/FAQ.vue';

const emit = defineEmits<{
  'banner-message': [message: string, type?: string]
}>();

const handleBannerMessage = (message: string, type?: string) => {
  emit('banner-message', message, type);
};
</script>
