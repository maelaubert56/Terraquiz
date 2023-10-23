<template>
  <div class="ResultsArea">
    <div class="text"> <p>Results</p> </div>

    <div id="Progress">
      <div class="load-bar-back">
        <div class="load-bar" :style="{width: score + '%'}">
          <h3 class="score">{{ score }}%</h3>
        </div>
      </div>
    </div>

    <div class="text"> <p>{{index}} / {{total}} {{msg}}</p> </div>

    <div class="next_area">
      <button class="play_again">Play Again</button>
    </div>

  </div>
</template>

<script>
export default {
  name: "ResultsArea",
  props: {
    score: Number,
    index: Number,
    total: Number,
    msg: String
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


.play_again{
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