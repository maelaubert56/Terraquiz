<template>
  <div id="Page">
    <img class="logo" :src="LogoSmall" alt="logo" @click="() => $router.push('/')" />

    <div class="title">
      <img class="arrow" src="../assets/arrow.png" alt="arrow"/>
      <h2 @click.prevent="redirectToMenu()">Capture the flag</h2>
    </div>

    <div class="Menu">
      <CategoryGameCard
          v-for="(quiz, index) in quizzes"
          :key="index"
          :name="quiz.quiz_name"
          :image="(quiz.quiz_image).toString()"
          :score="parseInt(quiz.progress_value)"
          @click.prevent="goToQuiz(quiz.quiz_id)"
      />

    </div>

    <FooterComponent :isConnected="true" />
  </div>
</template>

<script>

import CategoryGameCard from "@/components/MenuGameComponents/CategoryGameCard.vue";
import FooterComponent from "@/components/FooterComponent.vue";
import axios from 'axios';

export default {
  name: "MenuGames",
  data(){
    return{
      LogoSmall: require("@/assets/logo_terraquiz.svg"),
      quizzes: [],
    }
  },
  components: {
    CategoryGameCard,
    FooterComponent
  },
  created() {
    //check if there is a session
    if (!localStorage.getItem("session")) {
      this.$router.push("/");
    } else {
      //get the user id in the session
      this.session = JSON.parse(localStorage.getItem("session"));
      let user_id = this.session.user_id;
      let category_id = this.$route.query.cat
      console.log(category_id)

      axios.get(`${process.env.VUE_APP_SERVER_API_URL}/quiz/category/${category_id}/${user_id}`).then((response) => {
        this.quizzes = response.data;
        console.log(this.quizzes)
      });
    }
  },
  methods: {
    redirectToMenu() {
      this.$router.push("/menu");
    },
    goToQuiz(id_quiz) {
      this.$router.push("/quiz?cat=" + this.$route.query.cat + "&quiz=" + id_quiz);
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