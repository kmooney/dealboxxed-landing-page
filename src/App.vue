<script setup>
   import Analytics from '@vercel/analytics'
   import { ref } from 'vue';
   const bannerMsg = ref('')
   const showBanner = ref(false)

  const handleBannerMessage = (msg) => {
    bannerMsg.value = msg
    showBanner.value = true
  }

</script>

<template>
<v-app>
	<v-main class="main-app">
    <Analytics/>
    <v-snackbar
      v-model="showBanner"
      timeout="1500"
      location="top"
      class="custom-snackbar"
      transition="fade-transition"
    >
        {{bannerMsg}}

      </v-snackbar>

    <router-view @banner-message="handleBannerMessage" />
    </v-main>
</v-app>
</template>

<style scoped>
.custom-snackbar :deep(.v-snackbar__wrapper) {
  background: linear-gradient(135deg, hsl(165 55% 75%), hsl(210 70% 80%), hsl(230 60% 95%));
  border-radius: 8px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

.custom-snackbar :deep(.v-snackbar__content) {
  color: #3d3d3d;
  font-weight: 500;
}

</style>
