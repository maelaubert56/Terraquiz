<template>
  <div id="Page">
    <img class="logo" :src="LogoSmall" alt="logo"/>

    <div class="title">
      <img class="arrow" src="../assets/arrow.png" alt="arrow"/>
      <h2 @click.prevent="goToGameMenu()">Europe - Easy</h2>
      <img class="quiz_img" src="../assets/flag.png" alt="flag"/>
    </div>

    <div class="QuizArea">
      <!-- parameter image france_flag in QuizArea  -->
      <!-- <QuizArea :image="'france_flag.png'" /> -->
      <ResultsArea :score="65" :index="14" :total="18" :msg="'Great !'"/>
    </div>


    <FooterComponent :isConnected="true" />
  </div>
</template>

<script>

import FooterComponent from "@/components/FooterComponent.vue";
import QuizArea from "@/components/QuizComponents/QuizArea.vue";
import ResultsArea from "@/components/QuizComponents/ResultsArea.vue";
export default {
  name: "QuizView",
  data(){
    return{
      LogoSmall: require("@/assets/logo_terraquiz.svg")
    }
  },
  components: {
    FooterComponent,
    //QuizArea,
    ResultsArea
  },
  methods: {
    goToGameMenu() {
      this.$router.push("/menu-game");
    }
  }
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
.quiz_img{
  height: 50px;
}


</style>