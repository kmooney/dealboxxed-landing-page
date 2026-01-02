<template>
  <div class="card">
    <div>
      <h2 class="early-access"><v-icon icon="mdi-email-outline" color="red" size="large" /> Get early access</h2><p class="small">Be the first to know when Dealboxxed is ready.</p></div>
    <div>
      <v-form ref="form" class="early-access" @submit.prevent="handleSubmit">
        <v-text-field
            v-model="fullName"
            
            label="Your name"
            variant="outlined"
            bg-color="white"
            prepend-inner-icon="mdi-account-outline"
            :rules="validateName"
            hide-details="auto"
            class="mb-4"
          />

        <v-text-field
            v-model="emailAddress"
            label="Your Gmail address"
            variant="outlined"
            bg-color="white"
            prepend-inner-icon="mdi-email-outline"
            :rules="validateEmail"
            hide-details="auto"
            class="mb-4"
          />
        <v-btn type="submit" size="large" color="red" append-icon="mdi-arrow-right" class="white-text-btn">Get early access</v-btn>
        <p class="small centered">We'll notify you when Dealboxxed is ready to test. No spam, I promise!</p>
      <v-overlay 
        v-model="isSubmitting" 
        contained 
        class="align-center justify-center"
        scrim="white"
        opacity="0.7"
      >
        <v-progress-circular indeterminate color="primary" size="64" />
      </v-overlay>
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
  .early-access {
    position:relative;
  }
</style>

<script lang="ts" setup>

import { ref } from 'vue';

const emit = defineEmits<{'banner-message': [message: string, type: string]}>()

const fullName = ref('');
const emailAddress = ref('');
const target = "https://script.google.com/macros/s/AKfycbxrZ7Pw9LBCjeWCfAZWNGp_CJWuVvas3oMSkV9Xw6H6wRQIStsBnVwDRgbHLnt_yulW/exec"
const form = ref<any>(null);
const isSubmitting = ref(false);

const validateEmail = [
   (v: string) => !!v || 'Gmail address is required',
   (v: string) => /.+@gmail.com/.test(v) || 'Email must be a valid Gmail address.'
]

const validateName = [
   (v: string) => !!v || 'Tell us who you are!'
]

const handleSubmit = async () => {
  const {valid} = await form.value.validate();
  if (!valid) return;
  try {
    isSubmitting.value=true;
    await fetch(target, {
      method: 'POST',
      body: JSON.stringify({ 
        name: fullName.value, 
        email: emailAddress.value 
      })
    })
    emit('banner-message', "Thanks! We’ll be in touch soon.", "success");
    fullName.value = ""
    emailAddress.value = ""
    form.value.reset()
    form.value.resetValidation()

  } catch (e) {
    console.error(e)
  } finally {
    isSubmitting.value=false;
  }
}



</script>
