<template>
  <div class="Category">
    <h3>Capture the flag</h3>


    <img src="@/assets/flag.png" alt="flag">
  </div>

</template>

<script>
export default {
  name: "CategoryCard"
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