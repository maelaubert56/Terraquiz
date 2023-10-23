<template>
  <div class="QuizArea">
    <div class="text">
      <p>To which country belongs this flag ?</p>
    </div>

    <div class="QuizQuestion">
      <div class="question_image">
        <img :src="require(`@/assets/${image}`)" alt="flag"/>
      </div>
      <div class="question_answers">
        <button class="QuizArea__answers__answer">Paris</button>
        <button class="QuizArea__answers__answer">London</button>
        <button class="QuizArea__answers__answer">Berlin</button>
        <button class="QuizArea__answers__answer">Madrid</button>
      </div>
    </div>

    <div class="next_area">
      <button class="next_question">Next question</button>
    </div>

  </div>
</template>

<script>
export default {
  name: "QuizArea",
  props: {
    image: String
  }
}
</script>


<style scoped>

.QuizArea{
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;

  background-color: #5E5C89;
  border-radius: 20px;

  margin: 20px auto;
  padding: 20px 50px;
}

.QuizQuestion{
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  gap: 100px;
}

.question_image>img{
  height: 300px;
}

.question_answers{
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
  gap: 20px;
}

.question_answers button{
  width: 350px;
  height: 45px;

  border: none;
  border-radius: 30px;
  background: #46CDCF;
  box-shadow: 0px 4px 5px 0px rgba(0, 0, 0, 0.25);
}

.next_question{
  width: 300px;
  height: 45px;

  color: #47456C;
  border: none;
  border-radius: 30px;
  background: #ABEDD8;
  box-shadow: 0px 4px 5px 0px rgba(0, 0, 0, 0.25);
}


button{
  color: #FFF;
  font-size: 20px;
  font-style: normal;
  font-weight: 400;
  line-height: normal;
  font-family: "Concert One", cursive;
}

p{
  font-size: 20px;
}


</style>