<template>
  <v-container class="auth-container" fluid>
    <v-row align="center" justify="center" class="fill-height">
      <v-col cols="12" sm="8" md="6" lg="4">
        <v-card class="auth-card" elevation="0">
          <v-card-text class="text-center pa-8">
            <!-- Email Icon -->
            <div class="icon-wrapper mb-6">
              <v-icon color="red-darken-1" size="48">mdi-email-outline</v-icon>
            </div>

            <!-- Welcome Header -->
            <h1 class="auth-header mb-4">Welcome to<br>Dealboxxed</h1>

            <!-- Subtitle -->
            <p class="auth-subtitle mb-8">
              Sign in with your Gmail account to get started
            </p>

            <!-- Continue with Google Button -->
            <v-btn
              class="google-btn mb-6"
              size="large"
              variant="outlined"
              block
              @click="handleGoogleSignIn"
            >
              <v-icon class="mr-3" size="24">
                <svg viewBox="0 0 24 24" width="24" height="24">
                  <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>
                  <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
                  <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/>
                  <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/>
                </svg>
              </v-icon>
              Continue with Google
            </v-btn>

            <!-- Terms and Privacy -->
            <p class="terms-text">
              By signing in, you agree to our <a href="#" class="terms-link">Terms of Service</a> and
              <a href="#" class="terms-link">Privacy Policy</a>
            </p>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script setup lang="ts">
const handleGoogleSignIn = () => {
  // OAuth configuration - redirects to backend API which handles the OAuth flow
  const clientId = import.meta.env.VITE_GOOGLE_CLIENT_ID || 'YOUR_GOOGLE_CLIENT_ID';
  const backendUrl = import.meta.env.VITE_API_URL || 'http://localhost:8000';
  const redirectUri = `${backendUrl}/auth/google/callback`;

  // Scopes match those used in dealmail/dealboxxed/backends/gmail.py
  const scope = [
    'openid',
    'email',
    'profile',
    'https://www.googleapis.com/auth/gmail.readonly',
    'https://www.googleapis.com/auth/gmail.labels',
    'https://www.googleapis.com/auth/gmail.modify'
  ].join(' ');

  const authUrl = `https://accounts.google.com/o/oauth2/v2/auth?` +
    `client_id=${clientId}&` +
    `redirect_uri=${encodeURIComponent(redirectUri)}&` +
    `response_type=code&` +
    `scope=${encodeURIComponent(scope)}&` +
    `access_type=offline&` +
    `prompt=consent`;

  window.location.href = authUrl;
};
</script>

<style scoped>
.auth-container {
  min-height: 100vh;
  background: linear-gradient(135deg, hsl(4 70% 55% / .1), hsl(165 55% 45% / .1), hsl(210 70% 50% / .1));
  padding: 0;
}

.fill-height {
  min-height: 100vh;
}

.auth-card {
  background: white;
  border-radius: 16px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  max-width: 500px;
  margin: 0 auto;
}

.icon-wrapper {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 80px;
  height: 80px;
  background-color: rgba(244, 67, 54, 0.1);
  border-radius: 50%;
}

.auth-header {
  font-size: 2.5rem;
  line-height: 1.2;
  color: rgb(41, 48, 61);
  font-weight: 600;
}

.auth-subtitle {
  font-size: 1rem;
  color: rgb(113, 111, 126);
  line-height: 1.5;
}

.google-btn {
  text-transform: none;
  font-size: 1rem;
  padding: 12px 24px;
  border-color: rgba(0, 0, 0, 0.12);
  color: rgb(41, 48, 61);
  font-weight: 500;
  letter-spacing: 0;
}

.google-btn:hover {
  background-color: rgba(0, 0, 0, 0.02);
  border-color: rgba(0, 0, 0, 0.2);
}

.terms-text {
  font-size: 0.875rem;
  color: rgb(113, 111, 126);
  line-height: 1.5;
  margin-bottom: 0;
}

.terms-link {
  color: rgb(41, 48, 61);
  text-decoration: none;
  font-weight: 500;
}

.terms-link:hover {
  text-decoration: underline;
}
</style>
