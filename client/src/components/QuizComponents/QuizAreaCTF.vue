<template>
    <p>{{quiz_instruction}}</p>
    <span>{{this.vue}}/{{this.vueNb}}</span>

    <div class="QuizQuestion">
      <div class="question">
        <img :src="require(`@/assets/quiz/flags/${image}.svg`)" alt="flag"/>
      </div>
      <div class="question_answers">
        <button class="answer" :class="answers[0]" @click="checkAnswer(answers[0])" :id="answers[0]">
          {{formatWords(answers[0])}}
          <img src="@/assets/check.svg" alt="check" class="check">
          <img src="@/assets/cross.svg" alt="cross" class="cross">
        </button>
        <button class="answer" :class="answers[1]" @click="checkAnswer(answers[1])" :id="answers[1]">
          {{formatWords(answers[1])}}
          <img src="@/assets/check.svg" alt="check" class="check">
          <img src="@/assets/cross.svg" alt="cross" class="cross"></button>
        <button class="answer" :class="answers[2]" @click="checkAnswer(answers[2])" :id="answers[2]">
          {{formatWords(answers[2])}}
          <img src="@/assets/check.svg" alt="check" class="check">
          <img src="@/assets/cross.svg" alt="cross" class="cross"></button>
        <button class="answer" :class="answers[3]" @click="checkAnswer(answers[3])" :id="answers[3]">
          {{formatWords(answers[3])}}
          <img src="@/assets/check.svg" alt="check" class="check">
          <img src="@/assets/cross.svg" alt="cross" class="cross"></button>
      </div>
    </div>

    <div class="next_question_container">
      <button :class="'answered'+answered" class="next_question" @click="nextQuestion()">{{this.vue===this.vueNb ? 'See results' : 'Next question'}}</button>
    </div>
    <div class="particles particles_stars_hidden">
      <img src="@/assets/star.svg" alt="star" class="star1 star">
      <img src="@/assets/star.svg" alt="star" class="star2 star">
      <img src="@/assets/star.svg" alt="star" class="star3 star">
      <img src="@/assets/star.svg" alt="star" class="star4 star">
    </div>
    <div class="particles particles_wrong_chat_hidden">
      <img src="@/assets/wrong_chat.svg" alt="wrong_chat" class="wrong_chat1 wrong_chat">
      <img src="@/assets/wrong_chat.svg" alt="wrong_chat" class="wrong_chat2 wrong_chat">
      <img src="@/assets/wrong_chat.svg" alt="wrong_chat" class="wrong_chat3 wrong_chat">
      <img src="@/assets/wrong_chat.svg" alt="wrong_chat" class="wrong_chat4 wrong_chat">
    </div>


</template>

<script>
import axios from 'axios';

export default {
  name: "QuizAreaCTF",
  data(){
    return{
      answers:[],
      answered:false,
      vue:0,
      vueNb:0,
      image:'france',
      quiz_instruction:'Setup...',
      good_answer:"Setup",
      bad_answers:["Setup","Setup","Setup"],
      score:[]
    }
  },
  props: {
    quiz_id: Number,
    quiz_type: Number,
  },
  created() {
    this.setupQuiz();
    // create an array with the good answer and the bad answers
    this.answers = [this.good_answer, ...this.bad_answers];
    // shuffle the array
    this.answers.sort(() => Math.random() - 0.5);
    this.score = new Array(this.vueNb).fill(-1);
  },
  methods: {
    checkAnswer(answer) {
      if (!this.answered) {
        this.answered = true;
        let divs = document.getElementsByClassName("answer")
        Array.from(divs).forEach(element => {
          if (element.id === this.good_answer) {
            element.classList.add("good_answer");
            if (element.id === answer) {
              document.getElementsByClassName("particles_stars_hidden")[0].classList.remove("particles_stars_hidden");
              this.score[this.vue - 1] = 1;
            }
          } else if (element.id === answer && element.id !== this.good_answer) {
            element.classList.add("bad_answer");
            document.getElementsByClassName("particles_wrong_chat_hidden")[0].classList.remove("particles_wrong_chat_hidden");
            this.score[this.vue-1] = 0;
          } else {
            element.classList.add("not_answered");
          }
        });
      } else {
        console.log("already answered")
      }
    },
    setupQuiz() {
      let cat_id = this.$route.query.cat;
      axios.get(`${process.env.VUE_APP_SERVER_API_URL}/quiz/questions/${cat_id}/${this.quiz_id}`)
          .then((response) => {
            if(response.data.length === 0){
              this.$router.push({name: 'menu'})
            }else{
              // store it in local storage
              localStorage.setItem("quiz", JSON.stringify(response.data));
              this.vueNb = JSON.parse(localStorage.getItem("quiz")).length
              let question = JSON.parse(localStorage.getItem("quiz"))[0]
              this.vue = 1;
              this.quiz_instruction = "To which country belongs this flag ?";
              this.good_answer = question.question_CTF_answer;
              this.bad_answers = [question.question_CTF_bad1, question.question_CTF_bad2, question.question_CTF_bad3];
              this.answers = [this.good_answer, ...this.bad_answers];
              this.answers.sort(() => Math.random() - 0.5);
              this.image = question.question_CTF_flag;
              this.answered = false;
              // prerequest all the images in the quiz
              let images = JSON.parse(localStorage.getItem("quiz")).map((question) => {
                return question.question_CTF_flag
              })
              images.forEach((image) => {
                let img = new Image();
                img.src = require(`@/assets/quiz/flags/${image}.svg`);
              })
              // wait for the dom to be loaded
              this.$nextTick(() => {
                let divs2 = document.getElementsByClassName("answer")
                let i = 0;
                Array.from(divs2).forEach(element => {
                  element.classList.remove("smaller_font");
                  if (this.answers[i].length > 10) {
                    element.classList.add("smaller_font");
                  }
                  i++;
                });
              })
            }
          })
          .catch((error) => {
            console.log(error);
          });
    },
    nextQuestion() {
      if (this.vue < this.vueNb) {
        if (this.quiz_type === 1) { // 1 -> ctf
          /* remove the classes from the previous question */
          let divs = document.getElementsByClassName("answer")
          Array.from(divs).forEach(element => {
            element.classList.remove("good_answer");
            element.classList.remove("bad_answer");
            element.classList.remove("not_answered");
          });
          // add hidden class to the particles
          document.getElementsByClassName("star")[0].parentElement.classList.add("particles_stars_hidden");
          document.getElementsByClassName("wrong_chat")[0].parentElement.classList.add("particles_wrong_chat_hidden");

          let question = JSON.parse(localStorage.getItem("quiz"))[this.vue]
          this.vue += 1;
          this.quiz_instruction = "To which country belongs this flag ?";
          this.good_answer = question.question_CTF_answer;
          this.bad_answers = [question.question_CTF_bad1, question.question_CTF_bad2, question.question_CTF_bad3];
          this.answers = [this.good_answer, ...this.bad_answers];
          this.answers.sort(() => Math.random() - 0.5);
          this.image = question.question_CTF_flag;
          this.answered = false;
          // wait for the dom to be updated
          this.$nextTick(() => {
            let divs2 = document.getElementsByClassName("answer")
            let i = 0;
            Array.from(divs2).forEach(element => {
              element.classList.remove("smaller_font");
              if (this.answers[i].length > 10) {
                element.classList.add("smaller_font");
              }
              i++;
            });
          })
        }
      }
      else{
        this.$emit('quizFinished', this.score);
      }
    },
    formatWords(string) {
      string = string.replace(/_/g, ' ');
      return string.replace(/(^\w{1})|(\s+\w{1})/g, letter => letter.toUpperCase());
    }
  }
}
</script>


<style scoped>

p{
  font-size: 20px;
  margin: 0;
}

.QuizQuestion{
  height: 70%;
  width: 100%;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  gap: 20px;

}

.question{
  width:50%;
  height: 100%;
  display: flex;
  justify-content: center;
}

.question>img{
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 20px;
}

.question_answers{
  width: 50%;
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  align-items: center;
}

.question_answers button{
  position: relative;
  width: 100%;
  height: 20%;
  padding: 5px 20px;

  border: none;
  border-radius: 30px;
  background: #46CDCF;
  box-shadow: 0 4px 5px 0 rgba(0, 0, 0, 0.25);
  transition: 0.1s;
}

.smaller_font{
  font-size: 17px !important;
}

.question_answers button:hover{
  transform: translateX(5px);
  transition: 0.1s;
}

.cross, .check{
  position: absolute;
  top: 50%;
  right: 20px;
  transform: translateY(-50%);
  width: 20px;
  height: 20px;
  visibility: hidden;
}


.good_answer .check{
  visibility: visible;
}

.bad_answer .cross{
  visibility: visible;
}

.not_answered, .bad_answer{
  background: #B1BDBD !important;
}



.answeredfalse{
  transform: translateY(5px);
  opacity: 0;
  visibility: hidden;
  transition: 0.5s;
}

.answeredtrue{
  visibility: visible;
  transform: translateX(0px);
  opacity: 1;
  transition: 0.5s;
}



.next_question_container{
  height:100%;
  width:100%;
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
  align-items: center;

}

.next_question{
  width: fit-content;
  height: fit-content;
  padding: 5px 20px;

  color: #47456C;
  border: none;
  border-radius: 30px;
  background: #ABEDD8;
  box-shadow: 0 4px 5px 0 rgba(0, 0, 0, 0.25);
  transition: 0.1s;
}

.next_question:hover{
  transform: scale(0.95);
  transition: 0.1s;
}


button{
  padding: 5px 20px;
  color: #FFF;
  font-size: 20px;
  font-style: normal;
  font-weight: 400;
  line-height: normal;
  font-family: "Concert One", cursive;
  cursor: pointer;
}

.particles{
  position: absolute;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  pointer-events: none;
}

.star, .wrong_chat{
  position: absolute;
  visibility:visible;
  opacity: 1;
  transition: 0.3s ease-in-out;
}

.star1, .wrong_chat1{
  top: 10%;
  left: 10%;
  width: 50px;
  height: 50px;
}

.star2, .wrong_chat2{
  top: 20%;
  left: 90%;
  width: 40px;
  height: 40px;
  transform: scaleX(-1);
}

.star3, .wrong_chat3{
  top: 30%;
  left: 5%;
  width: 30px;
  height: 30px;
}

.star4, .wrong_chat4{
  top: 40%;
  left:95%;
  width: 20px;
  height: 20px;
  transform: scaleX(-1);
}





.particles_stars_hidden .star1, .particles_stars_hidden .star3{
  opacity: 0;
  visibility: hidden;
  transform: translateY(-100%) scaleX(-1);
}

.particles_wrong_chat_hidden .wrong_chat1, .particles_wrong_chat_hidden .wrong_chat3{
  opacity: 0;
  visibility: hidden;
  transform: translateY(-100%) scaleX(-1);
}

.particles_stars_hidden .star2, .particles_stars_hidden .star4{
  opacity: 0;
  visibility: hidden;
  transform: translateY(-100%) scaleX(1);
}

.particles_wrong_chat_hidden .wrong_chat2, .particles_wrong_chat_hidden .wrong_chat4{
  opacity: 0;
  visibility: hidden;
  transform: translateY(-100%) scaleX(1);
}

@media (max-width: 768px) {


  .QuizQuestion {
    height:fit-content;
    flex-direction: column;
    justify-content: flex-start;
    gap: 20px;
  }

  .question {
    width: 50%;
    height: 100%;
    object-fit:contain;
  }

  .question>img {
    height:100%
  }

  .question_answers {
    flex-direction: row;
    flex-wrap: wrap;
    width: 100%;
    height: fit-content;
    gap:10px;
  }

  .question_answers button {
    width: 48%;
    height: fit-content;
  }



  p{
    font-size: 16px;
  }

  .next_question{
    width: 100%;
    height: fit-content;
  }

  .star2, .wrong_chat2{
    left: 80%;
  }

  .star4, .wrong_chat4{
    left: 90%;
  }



}


</style>