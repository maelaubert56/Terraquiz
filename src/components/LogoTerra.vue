<template>
  <div class="logo">
    <div class="logo_left">
      <h1>TERRA</h1>
      <h1>QUIZ</h1>
    </div>
    <img src="../assets/logo.png" alt="Logo" class="logo_right">
  </div>
</template>

<script>
  export default {
    name: 'LogoTerra'
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1 {
  font-size: 100px;
  margin: 0;
  padding: 0;
  letter-spacing: 30px;
}
.logo {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: row;
}

.logo_left{
  display: flex;
  justify-content: center;
  align-items: flex-end;
  flex-direction: column;
}

.logo_right{
  width: 200px;
  height: 200px;
  margin-left: 0px;
}

</style>