<template>
  <div id="MenuPage">
    <img class="logo" :src="LogoSmall" alt="logo"/>

    <h2 @click.prevent="redirectToMenu()">Capture the flag</h2>

    <div class="Menu">
      <CategoryCard
          v-for="(category, index) in categories"
          :key="index"
          :category="category.name"
          :image="category.image"
          :score="category.score"
      />

    </div>

    <FooterComponent :isConnected="true" />
  </div>
</template>

<script>

import CategoryCard from "@/components/MenuComponents/CategoryCard.vue";
import FooterComponent from "@/components/FooterComponent.vue";

export default {
  name: "MenuGames",
  data(){
    return{
      LogoSmall: require("@/assets/logo_terraquiz.svg"),
    }
  },
  components: {
    CategoryCard,
    FooterComponent
  },
  methods: {
    redirectToMenu() {
      this.$router.push("/menu");
    }
  },
}
</script>

<style scoped>


#MenuPage{
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-direction: column;
  width: 100%;
  height: 100vh;
  background-color: #48466D;
  color:white;
  font-family: "Concert One", cursive;
}

.logo{
  height: 100px;
  margin: 20px auto;
}

.Menu{
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
  gap: 20px;
}

</style>