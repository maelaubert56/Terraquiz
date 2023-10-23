<template>
  <div class="Category">
    <h3>{{ category }}</h3>
    <div id="Progress">
      <div class="load-bar-back">
        <div class="load-bar" :style="{width: score + '%'}">
          <h3 class="score">{{ score }}%</h3>
        </div>
      </div>
    </div>
    <img :src="require(`@/assets/categories_images/${image}.png`)" alt="category image" />
  </div>

</template>

<script>
export default {
  name: "CategoryCard",
  props: {
    category: String,
    image: String,
    score: Number,
  },
}
</script>

<style scoped>

.Category{
  padding: 20px 25px;

  border-radius: 30px;
  background: #5E5C89;
  box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.25);

  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  gap: 20px;
  cursor:pointer;
  transition: all 0.2s ease-in-out;
}

.Category:hover{
  transform: scale(1.01);
  transition: all 0.3s ease-in-out;
}

img{
  height: 80px;
}

h3{
  margin:0;

  color: #FFF;
  font-size: 30px;
  font-style: normal;
  font-weight: 400;
  line-height: normal;
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
  background: #46CDFF;
  transition: width 0.5s ease-in-out;
}

.score{
  position: absolute;
  right:0;
  top:0;
  transform: translate(50%,-100%);
  color: #FFF;
  font-size: 20px;
  font-style: normal;
  font-weight: 400;
  line-height: normal;
}

</style>