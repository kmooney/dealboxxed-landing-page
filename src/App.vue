<script setup>
   import Hero from './components/Hero.vue'
   import FAQ from './components/FAQ.vue'
</script>

<template>
<v-app>
	<v-main>
    <Hero 
        title="Take control of your inbox" 
        msg="Dealboxxed scans your Gmail promotions for deals, compiles them into a weekly digest, and automatically archives everything. Never miss a good deal. Never drown in promos."
        
      />
    <FAQ/>
	</v-main>
</v-app>
</template>
