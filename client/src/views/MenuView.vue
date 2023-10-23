<template>
  <div id="Page">
    <img class="logo" :src="LogoSmall" alt="logo"/>

    <div class="Menu">
      <CategoryCard
          v-for="(category, index) in categories"
          :key="index"
          :category="category.name"
          :image="category.image"
          :score="category.score"
          @click.prevent="goToGameMenu()"
      />
    </div>

    <FooterComponent :isConnected="true" />
  </div>
</template>

<script>

import CategoryCard from "@/components/MenuComponents/CategoryCard.vue";
import FooterComponent from "@/components/FooterComponent.vue";

export default {
  name: 'MenuPage',
  data() {
    return {
      LogoSmall: require("@/assets/logo_terraquiz.svg"),
      categories: [
        { name: "Capture the Flag", image: "flag.png", score: "50" },
        { name: "What did you said ?", image: "languages.png", score: "60" },
        { name: "Yet Another Category", image: "flag.png", score: "70" },
        { name: "One More Category", image: "flag.png", score: "80" },
        { name: "Last Category", image: "flag.png", score: "90" },
      ],
    };
  },
  components: {
    CategoryCard,
    FooterComponent
  },
  methods: {
    goToGameMenu() {
      this.$router.push("/menu-game");
    }
  },
};

</script>


<style scoped>

#Page{
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-direction: column;
  width: 100%;
  min-height: 100vh;
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
