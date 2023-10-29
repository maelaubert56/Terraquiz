<template>
  <div id="Page">
    <img class="logo" :src="LogoSmall" alt="logo" @click="() => $router.push('/')" />

    <div class="title">
      <img class="arrow" src="../assets/arrow.png" alt="arrow" @click.prevent="goToGameMenu()" />
      <h2>Europe - Easy</h2>
      <img class="quiz_img" src="../assets/flag.png" alt="flag"/>
    </div>

    <div class="QuizArea">
      <QuizArea v-if="vue>=0" :quiz_type="quiz_cat" :quiz_id="quiz_id" @quizFinished="quizFinished" />
      <ResultsArea v-if="vue===-1" :score="this.score" @back="goToGameMenu" />
    </div>


    <FooterComponent :isConnected="true" />
  </div>
</template>

<script>

import FooterComponent from "@/components/FooterComponent.vue";
import QuizArea from "@/components/QuizComponents/QuizArea.vue";
import ResultsArea from "@/components/QuizComponents/ResultsArea.vue";
import axios from 'axios';

export default {
  name: "QuizView",
  data(){
    return{
      LogoSmall: require("@/assets/logo_terraquiz.svg"),
      vue:0,
      quiz_cat:1,
      quiz_id:1,
      score:[]
    }
  },
  components: {
    FooterComponent,
    QuizArea,
    ResultsArea
  },
  methods: {
    goToGameMenu() {
      this.$router.push(`/menu-game?cat=${this.quiz_cat}`);
    },
    percentage(score){
      /* count the number of good answers (==1) and divide by the number of questions to get the percentage */
      let good_answers = 0;
      for (let i=0; i<score.length; i++){
        if (score[i]===1){
          good_answers++;
        }
      }
      return Math.round(good_answers/score.length*100);
    },
    updateProgress(user_id, quiz_id, progress_value){
      axios.post(`${process.env.VUE_APP_SERVER_API_URL}/quiz/progress/${quiz_id}/${user_id}`, {
        progress_value: progress_value
      }).then((response) => {
        console.log(response.data);
      });
    },
    quizFinished(score){
      this.vue=-1;
      this.score=score;
      this.session = JSON.parse(localStorage.getItem("session"));
      let user_id = this.session.user_id;
      let quiz_id = this.quiz_id;
      // if progress is better than current progress, update it
      axios.get(`${process.env.VUE_APP_SERVER_API_URL}/quiz/progress/${quiz_id}/${user_id}`).then((response) => {
        console.log(response.data);
        if (response.data.progress_value < this.percentage(this.score)){
          this.updateProgress(user_id, quiz_id, this.percentage(this.score));
        }
      });

    }
  },
  created() {
    if (!localStorage.getItem("session")) {
      this.$router.push("/");
    } else {
      this.quiz_cat = parseInt(this.$route.query.cat);
      this.quiz_id = parseInt(this.$route.query.quiz);
      console.log(this.quiz_cat)
      console.log(this.quiz_id)
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
  height: 100vh;
  background-color: #48466D;
  color:white;
  font-family: "Concert One", cursive;
}

.logo{
  height: 100px;
  margin: 20px auto;
  cursor: pointer;
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

.QuizArea{
  height: 50%;
  width: 70vw;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;

  background-color: #5E5C89;
  border-radius: 20px;

  margin: 20px auto;
  padding: 20px 50px;
}

</style>