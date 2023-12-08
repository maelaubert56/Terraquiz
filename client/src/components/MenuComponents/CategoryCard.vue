<template>
  <div class="Category">
    <h3>{{ category }}</h3>
    <div id="Progress">
      <div class="load-bar-back">
        <div class="load-bar" :style="{ width: displayedScore + '%' }">
          <h3 class="score">{{ displayedScore }}%</h3>
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
  data() {
    return {
      loadBarWidth: 0,
      displayedScore: 0,
    };
  },
  mounted() {
    this.animateScore();
  },
  methods: {
    easeInOut(t) {
      return t < 0.5 ? 2 * t * t : -1 + (4 - 2 * t) * t;
    },
    animateScore() {
      const duration = 1000; // Set the animation duration in milliseconds
      const startTime = performance.now();

      const animate = (currentTime) => {
        const elapsedTime = currentTime - startTime;
        if (elapsedTime < duration) {
          const progress = this.easeInOut(elapsedTime / duration);
          this.displayedScore = Math.floor(progress * this.score);
          this.loadBarWidth = progress * 100;
          requestAnimationFrame(animate);
        } else {
          this.displayedScore = this.score;
          this.loadBarWidth = 100;
        }
      };

      requestAnimationFrame(animate);
    }
  },
};
</script>

<style scoped>

.Category{
  width:100%;
  padding: 20px 25px;

  border-radius: 30px;
  background: #5E5C89;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.25);

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

@media (max-width: 768px) {
  .Category{
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 40px;
    padding-bottom: 30px;
  }

  h3{
    font-size: 24px;
  }

  .Category>img {
    display: none;
  }

  #Progress{
    width: 100%;
  }

  .load-bar-back{
    width: 80%;
    height:16px;
  }
}

</style>