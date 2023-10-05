<template>
  <div id="HomePage">
    <img src="../../assets/background.png" alt="Plane" class="plane">
    <div>
      <h2>challenge your geography skills</h2>
      <form>
        <input type="text" placeholder="Username" class="name" required @input="checkInput($event.target)">
        <input type="text" placeholder="Password" class="password" required @input="checkInput($event.target)">
        <input type="submit" value="Play" class="play" onclick="window.location.href = '/menu'">
        <a>Register</a>
        <p class="error_message">No spaces allowed</p>
      </form>
      <img src="../../assets/github.png" alt="github">
    </div>
  </div>
</template>

<script>
export default {
  name: 'HomePage',
  components: {},
  methods: {
    checkInput(input) {
      console.log(input.value)
      if (input.value.includes(" ")) {
        input.classList.add("invalid");
      } else {
        input.classList.remove("invalid");
      }
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>


#HomePage>img{
  position: absolute;
  height:100%;
  top:0;
  left:50%;
  transform: translate(-50%, 0);
}

h1 {
  font-weight: normal;
  margin: 0;
  padding: 0;
}

#HomePage>div{
  position: absolute;
  top: 40%;
  left: 50%;
  transform: translate(-50%,0);
  display:flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  height: 60%;
}

h2{
  width: 100%;
  text-align: center;
  font-size: 35px;
  letter-spacing: 7.5px;
  font-weight: 400;

}

form{
  position: relative;
  width: 400px;
  height: 200px;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  align-items: center;
  gap:10px;
}


form .error_message{
  position: absolute;
  top: -10%;
  transform: translate(0,-100%);
  font-size: 15px;
  color: #cf4646;
  font-weight: 400;
  letter-spacing: 2.5px;
  opacity: 0%;
  transition: 0.2s;
}

/* si la classe invalid est présente, on affiche le message d'erreur */
form .invalid ~ .error_message{
  top: -15%;
  opacity: 100%;
  transition: 0.5s;
}

form input{
  width: 300px;
  height: 50px;
  border: none;
  border-radius: 25px;
  font-size: 20px;
  text-align: center;
  font-weight: 400;
  letter-spacing: 2.5px;
  outline: none;
}

form input[type="submit"]{
  background: #46CDCF;
  font-family: Concert One, Avenir, Helvetica, Arial, sans-serif;
  color: white;
  cursor: pointer;
  font-size:30px;
  margin-top:15px;
  transition:0.5s;
}

form input[type="text"]:valid{
  box-shadow: 0px 0px 15px 0px #46cf61;
  transition: 0.2s;
}

form .invalid{
  box-shadow: 0px 0px 15px 0px #cf4646 !important;
  transition: 0.2s;
}

form input[type="submit"]:hover{
  box-shadow: 0px 0px 10px 0px #46CDCF;
  transition: 0.2s;
}

form a{
  font-size: 20px;
  font-weight: 400;
  letter-spacing: 2.5px;
  text-decoration: underline;
}

#HomePage>div>img{
  width: 50px;
  height: 50px;
  cursor: pointer;
  margin-bottom: 20px;
}

form a{
  color: white;
  cursor: pointer;
  transition: 0.5s;
}

form a:hover{
  transition: 0.5s;
  transform: scale(1.05);
}
</style>
