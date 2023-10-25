<template>
  <div id="NotFound">
    <img src="@/assets/logo.png" alt="logo" @click="() => $router.push('/')" />
    <div>
      <h2>404 error...</h2>
      <h1>It seems you're lost</h1>
      <p>If you think this is a mistake, please contact us on <a href="https://github.com/maelaubert56/terraquiz">GitHub</a></p>
    </div>
    <a href="/">Go back to the home page</a>
  </div>
</template>

<script>

export default {
    name: 'NotFound'
}
</script>

<style scoped>

#NotFound {
  width: 100%;
  height: 100vh;
  background-color: #48466D;
  display: flex;
  flex-direction: column;
  justify-content: space-evenly;
  align-items: center;
}

#NotFound>div{
  display: flex;
  flex-direction: column;
  justify-content: center;
  gap: 10px;
}

h1, h2,a, p{
  font-family: "Concert One", cursive;
  text-align: center;
  margin: 0;
  padding: 0;
  color: white;

}


h1 {
  font-size: 70px;
  letter-spacing: 7.5px;
}

h2 {
  font-size: 40px;
  letter-spacing: 7.5px;
}

div>a{
  font-size: 20px;
  letter-spacing: 5px;
  text-decoration: none;
  color: white;
  border: 2px solid white;
  padding: 10px 20px;
  border-radius: 10px;
  transition: 0.2s;
}

div>a:hover {
  background-color: white;
  color: #48466D;
  transition: 0.2s;
}

img {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 200px;
  height: 200px;
  cursor: pointer;
}
</style>