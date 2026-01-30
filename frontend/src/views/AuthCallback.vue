<template>
  <v-container class="callback-container" fluid>
    <v-row align="center" justify="center" class="fill-height">
      <v-col cols="12" sm="8" md="6" lg="4">
        <v-card class="callback-card" elevation="0">
          <v-card-text class="text-center pa-8">
            <div v-if="loading">
              <v-progress-circular
                indeterminate
                color="red-darken-1"
                size="64"
                class="mb-4"
              />
              <h2 class="mb-4">Connecting your account...</h2>
              <p class="callback-text">Please wait while we complete the setup.</p>
            </div>

            <div v-else-if="error">
              <v-icon color="error" size="64" class="mb-4">mdi-alert-circle</v-icon>
              <h2 class="mb-4">Authentication Failed</h2>
              <p class="callback-text mb-4">{{ errorMessage }}</p>
              <v-btn
                color="red-darken-1"
                variant="flat"
                @click="redirectToAuth"
              >
                Try Again
              </v-btn>
            </div>

            <div v-else-if="success">
              <v-icon color="success" size="64" class="mb-4">mdi-check-circle</v-icon>
              <h2 class="mb-4">Success!</h2>
              <p class="callback-text">Your Gmail account has been connected.</p>
            </div>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';
import { useRoute, useRouter } from 'vue-router';

const route = useRoute();
const router = useRouter();

const loading = ref(true);
const error = ref(false);
const success = ref(false);
const errorMessage = ref('');

const redirectToAuth = () => {
  router.push('/auth');
};

onMounted(async () => {
  // This page handles redirects from the backend after OAuth processing
  const token = route.query.token as string;
  const sessionId = route.query.session as string;
  const successParam = route.query.success as string;
  const email = route.query.email as string;
  const errorParam = route.query.error as string;

  if (errorParam) {
    loading.value = false;
    error.value = true;
    errorMessage.value = errorParam === 'access_denied'
      ? 'You denied access to your Gmail account.'
      : errorParam === 'authentication_failed'
      ? 'Authentication failed. Please try again.'
      : 'An error occurred during authentication.';
    return;
  }

  if (successParam === 'true' || token || sessionId) {
    try {
      // Store the token/session from the backend
      if (token) {
        localStorage.setItem('auth_token', token);
      }
      if (sessionId) {
        localStorage.setItem('session_id', sessionId);
      }
      if (email) {
        localStorage.setItem('user_email', email);
      }

      // Simulate processing time for UX
      await new Promise(resolve => setTimeout(resolve, 1000));

      loading.value = false;
      success.value = true;

      // Redirect to home after 2 seconds
      setTimeout(() => {
        router.push('/');
      }, 2000);
    } catch (err) {
      loading.value = false;
      error.value = true;
      errorMessage.value = 'Failed to complete authentication. Please try again.';
      console.error('Auth callback error:', err);
    }
  } else {
    loading.value = false;
    error.value = true;
    errorMessage.value = 'No authentication information received from backend.';
  }
});
</script>

<style scoped>
.callback-container {
  min-height: 100vh;
  background: linear-gradient(135deg, hsl(4 70% 55% / .1), hsl(165 55% 45% / .1), hsl(210 70% 50% / .1));
  padding: 0;
}

.fill-height {
  min-height: 100vh;
}

.callback-card {
  background: white;
  border-radius: 16px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  max-width: 500px;
  margin: 0 auto;
}

.callback-text {
  font-size: 1rem;
  color: rgb(113, 111, 126);
  line-height: 1.5;
}

h2 {
  color: rgb(41, 48, 61);
  font-size: 2rem;
}
</style>
