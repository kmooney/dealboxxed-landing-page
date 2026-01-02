<template>

  <div class="card-container">
    <div class="card">
      <div class="icon-wrapper scanning">
      <v-icon icon="mdi-inbox-outline scan" size="large" color="red"/>
      </div>
      <h4>Smart scanning</h4>
      <p class="small centered">Uses Gmail's promotional tags to identify and process your promo emails</p>
    </div>

    <div class="card">
      <div class="icon-wrapper digest">
      <v-icon icon="mdi-shimmer" size="large" color="green"/>
      </div>
      <h4>Weekly digest</h4>
      <p class="small centered">Get one email per week with all the best deals</p>
    </div>

    <div class="card">
      <div class="icon-wrapper archive">
      <v-icon icon="mdi-archive-check-outline" size="large" color="blue"/>
      </div>
      <h4>Auto archive</h4>
      <p class="small centered">Promos are safely archived, not deleted. Find them anytime in your special folder</p>
    </div>
  </div>

</template>

<style scoped>
div.card-container {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-column-gap: 2rem;
  margin-top: 2rem;
}

div.card {
    box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 6px;
    flex-direction: row;
    max-width: 300px;
    border-radius: 10px;
    background: white;
    margin-bottom: 1.5rem;
    padding: 1.5em;

    h4 {
      padding: 0;
      margin: 0;
      margin-top: 0.75em;
      text-align: center;
    }
}
.icon-wrapper {
  width: 50px;
  height: 50px;
  padding: 11px;
  border-radius: 10px;
  margin-left: auto; 
  margin-right:auto;
  margin-bottom: 1.25em;
}

.icon-wrapper.scanning {
  background-color: rgb(255, 240, 240);
}
.icon-wrapper.digest {
  background-color: rgb(240, 255, 240);
}
.icon-wrapper.archive {
  background-color: rgb(240, 240, 255);
}
</style>
