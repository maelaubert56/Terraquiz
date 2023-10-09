<template>
  <form class="not_connected"  v-if="!isConnected">
    <div class="field_div">
      <input type="text" placeholder="Username" class="name" required @input="checkInput($event.target)">
    </div>
    <!-- for the password, the characters should be hidden -->
    <div class="field_div">
      <input type="password" placeholder="Password" class="password" required @input="checkInput($event.target)">
      <img src="@/assets/eye_close.png" alt="eye" class="eye" @click="showPassword($event.target)">
    </div>
    <input type="submit" value="Play" class="play" @click.prevent="redirectToMenu">
    <a>Register</a>
    <p class="error_message">No spaces allowed</p>
  </form>
  <!-- if connected -->
  <form class="connected"  v-if="isConnected">
    <img src="/assets/profile_pictures/3D_avatars_pack/Betty.svg" alt="profile picture" class="profile_picture">
    <span class="username">geraldine54</span>
    <input type="submit" value="Play" class="play" @click.prevent="redirectToMenu">
  </form>
</template>

<script>
export default {
  name: 'MenuPage',
  props: {
    isConnected: Boolean
  },
  methods: {
    redirectToMenu() {
      // Redirigez vers la page du menu
      this.$router.push('/menu');

    },
    checkInput(target) {
      // Vérifiez que les champs du formulaire ne contiennent pas d'espace
      if (target.value.includes(' ')) {
        target.classList.add('invalid');
        target.parentNode.classList.add('invalid');

      } else {
        target.classList.remove('invalid');
        target.parentNode.classList.remove('invalid');
      }
    },
    showPassword(target) {
      // Affichez le mot de passe en clair ou masquez-le
      if (target.previousElementSibling.type === 'password') {
        target.previousElementSibling.type = 'text';
        target.src = require('@/assets/eye_open.png');
      } else {
        target.previousElementSibling.type = 'password';
        target.src = require('@/assets/eye_close.png');
      }
    }
  }
}
</script>

<style scoped>
form{
  position: relative;
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
  opacity: 0;
  transition: 0.2s;
}


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
  padding: 10px 0;
  /* remonter le texte */
  transform: translate(0,-10%);
}

form input[type="text"]:valid, form input[type="password"]:valid{
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


.field_div{
  position: relative;
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

.eye{
  position: absolute;
  top: 50%;
  right: 0;
  transform: translate(0,-50%);
  margin-right: 10px;
  cursor: pointer;
  transition: 0.5s;

  width: 30px;
  height: 30px;
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

.profile_picture{
  width: 70px;
  height: 70px;
  border-radius: 50%;
  margin-top: 10px;
}
</style>