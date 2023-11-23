<template>
  <div id="Page">
    <img class="logo" :src="LogoSmall" alt="logo" @click="() => $router.push('/')" />

    <div class="title">
      <img class="arrow" src="../assets/arrow.png" alt="arrow" @click.prevent="redirectToMenu()"/>
      <h2>{{cat_name}}</h2>
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
      cat_name: ""
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

      axios.get(`${process.env.VUE_APP_SERVER_API_URL}/quiz/category/${category_id}/${user_id}`).then((response) => {
        this.quizzes = response.data;
      });

      axios.get(`${process.env.VUE_APP_SERVER_API_URL}/categories/name/${category_id}`).then((response) => {
        this.cat_name = response.data.category_name;
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
  width:70%;
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
  height: 30px;
}

@keyframes move{
  0%{
    transform: translateX(0px);
  }
  100%{
    transform: translateX(-5px);
  }
}

.arrow:hover{
  /* move from right to left */
  cursor: pointer;
  animation: move 0.5s ease-in-out infinite alternate;
}

</style>