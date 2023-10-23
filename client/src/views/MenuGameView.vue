<template>
  <div id="Page">
    <img class="logo" :src="LogoSmall" alt="logo" @click="() => $router.push('/')" />

    <div class="title">
      <img class="arrow" src="../assets/arrow.png" alt="arrow"/>
      <h2 @click.prevent="redirectToMenu()">Capture the flag</h2>
    </div>

    <div class="Menu">
      <CategoryGameCard
          v-for="(game, index) in games"
          :key="index"
          :game="game.name"
          :image="game.image"
          :score="game.score"
          @click.prevent="goToQuiz()"
      />

    </div>

    <FooterComponent :isConnected="true" />
  </div>
</template>

<script>

import CategoryGameCard from "@/components/MenuGameComponents/CategoryGameCard.vue";
import FooterComponent from "@/components/FooterComponent.vue";

export default {
  name: "MenuGames",
  data(){
    return{
      LogoSmall: require("@/assets/logo_terraquiz.svg"),
      games: [
        { name: "Europe - Easy", image: "flag.png", score: "50" },
        { name: "Asia - Easy", image: "flag.png", score: "60" },
        { name: "Africa - Easy", image: "flag.png", score: "70" },
        { name: "Europe - Medium", image: "flag.png", score: "80" },
        { name: "Asia - Medium", image: "flag.png", score: "30" },
      ],
    }
  },
  components: {
    CategoryGameCard,
    FooterComponent
  },
  methods: {
    redirectToMenu() {
      this.$router.push("/menu");
    },
    goToQuiz() {
      this.$router.push("/quiz");
    }
  },
}
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

  cursor: pointer;
}

.Menu{
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
  gap: 20px;
}

.title{
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  gap: 20px;
}

.arrow{
  height: 50px;
}

</style>