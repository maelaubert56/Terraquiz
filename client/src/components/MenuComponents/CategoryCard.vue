<template>
  <div class="Category">
    <h3>{{ category }}</h3>
    <div class="progress">
      <h3 id="#score">50%</h3>
      <div class="progress-bar">
        <div class="progress-bar-back"></div>
      </div>
    </div>
    <img :src="require(`@/assets/${image}`)" alt="category image" />
  </div>

</template>

<script>
export default {
  name: "CategoryCard",
  props: {
    category: String,
    image: String,
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


</style>