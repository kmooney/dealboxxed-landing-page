<template>
  <div class="card">
    <div>
      <h2 class="early-access"><v-icon icon="mdi-email-outline" color="red" size="large" /> Get early access</h2><p class="small">Be the first to know when Dealboxxed is ready.</p></div>
    <div>
      <v-form @submit.prevent="handleSubmit">
        <v-text-field
            v-model="fullName"
            label="Your name"
            variant="outlined"
            bg-color="white"
            prepend-inner-icon="mdi-account-outline"
          />
        <v-text-field
            v-model="emailAddress"
            label="Your gmail email address"
            variant="outlined"
            bg-color="white"
            prepend-inner-icon="mdi-email-outline"
          />
        <v-btn type="submit" size="large" color="red" append-icon="mdi-arrow-right" class="white-text-btn">Get early access</v-btn>
        <p class="small centered">We'll notify you when Dealboxxed is ready to test. No spam, I promise!</p>
      </v-form>
    </div>
  </div>
</template>

<style scoped>
  div.card {
    display: flex;
    border: 2px dashed red;
    flex-direction: row;
    width: 100%;
    max-width: 800px;
    border-radius: 5px;
    background: white;
    margin-bottom: 1.5rem;
    padding: 1.5em;
  }

  .white-text-btn :deep() {
    width: 100%;
    .v-btn__content,
    .v-icon {
      color: white !important;
    }
    margin-bottom: 0.5rem;
  }
</style>

<script lang="ts" setup>
import { ref } from 'vue';


  const fullName = ref('');
  const emailAddress = ref('');
  const handleSubmit = () => {};
</script>
