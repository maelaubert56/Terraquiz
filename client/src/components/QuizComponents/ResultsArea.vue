<template>
  <div class="ResultsArea">
    <div class="text"> <p>Results</p> </div>

    <div id="Progress">
      <div class="load-bar-back">
        <div class="load-bar" :style="{width: percentage() + '%'}">
          <h3 class="score">{{percentage()}}%</h3>
        </div>
      </div>
    </div>

    <div class="text"> <p>{{nbGoodAnswer()}} / {{nbTotal()}} {{msg()}}</p> </div>

    <div class="next_area">
      <button class="back" @click="$emit('back')">
        Back to Quizzes</button>
    </div>

  </div>
</template>

<script>
export default {
  name: "ResultsArea",
  props: {
    score: Array
  },
  methods: {
    nbGoodAnswer(){
      return this.score.filter(x => x === 1).length;
    },
    nbTotal(){
      return this.score.length;
    },
    percentage(){
      return Math.round(this.nbGoodAnswer() / this.nbTotal() * 100);
    },
    msg(){
      let percentage = this.percentage()
      let message = (percentage === 100 ? "Perfect!" : percentage >= 80 ? "Great!" : percentage >= 60 ? "Good!" : percentage >= 40 ? "Not bad!" : percentage >= 20 ? "You can do better!" : "Try again!")
      console.log(message)
      return message
    }
  }
}
</script>

<style scoped>

.ResultsArea{
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 30px;

  background-color: #5E5C89;
  border-radius: 20px;

  margin: 20px auto;
  padding: 20px 50px;
}

#Progress{
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 10px;
}

.load-bar-back{
  position: relative;
  width: 300px;
  height: 20px;
  padding-right: 0;
  align-items: center;
  border-radius: 10px;
  background: #3D84A8;
}

.load-bar{
  position: absolute;
  height: 20px;
  border-radius: 10px;
  background: #ABEDD8;
  transition: width 0.5s ease-in-out;
}

.score{
  position: absolute;
  right:0;
  top:0;
  transform: translate(50%,-200%);
  color: #ABEDD8;
  font-size: 20px;
  font-style: normal;
  font-weight: 400;
  line-height: normal;
}


.back{
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

@media (max-width: 768px) {
  .ResultsArea{
    padding: 20px 0;
    margin:0;
  }
}

</style>