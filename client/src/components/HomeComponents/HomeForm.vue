<template>
  <!-- login form -->
  <form class="not_connected"  v-if="!isConnected && loginForm" @submit.prevent="login">
    <div class="field_div">
      <input type="text" placeholder="Username" class="name" v-model="username_form" required @input="checkInput($event.target)">
    </div>
    <!-- for the password, the characters should be hidden -->
    <div class="field_div">
      <input type="password" placeholder="Password" class="password" required v-model="password_form" @input="checkInput($event.target)">
      <img src="@/assets/eye_close.png" alt="eye" class="eye" @click="showPassword($event.target)">
    </div>
    <input type="submit" value="Login" class="play">
    <a @click="switchForm" class="register">Register</a>
    <p class="error_message">No spaces allowed</p>
  </form>

  <!-- register form -->
  <form class="not_connected"  v-if="!isConnected && !loginForm" @submit.prevent="register">
    <div v-if="pp_selected" class="profile_picture_div" @click="$emit('openModalEvent')">
      <img :src="'/assets/profile_pictures/3D_avatars_pack/' + pp_selected + '.svg'" alt="profile picture" class="profile_picture">
      <img src="@/assets/edit.svg" alt="edit" class="edit">
    </div>
    <div v-else @click="$emit('openModalEvent')" class="open-modal-button">Choose Avatar</div>
    <div class="field_div">
      <input type="text" placeholder="Username" class="name" v-model="username_form" required @input="checkInput($event.target)">
    </div>
    <!-- for the password, the characters should be hidden -->
    <div class="field_div">
      <input type="password" placeholder="Password" class="password" required v-model="password_form" @input="checkInput($event.target)">
      <img src="@/assets/eye_close.png" alt="eye" class="eye" @click="showPassword($event.target)">
    </div>
    <input type="submit" value="Register" class="play">
    <a @click="switchForm" class="register">Login</a>
    <p class="error_message">No spaces allowed</p>
  </form>

  <!-- if connected -->
  <form class="connected"  v-if="isConnected" @submit.prevent="play">
    <img :src="'/assets/profile_pictures/3D_avatars_pack/' + pp_connected + '.svg'" alt="profile picture" class="profile_picture">
    <span class="username">{{username_connected}}</span>
    <input type="submit" value="Play" class="play">
  </form>
</template>

<script>
import axios from 'axios';
import bcrypt from 'bcryptjs';
const salt = bcrypt.genSaltSync(10);




export default {
  name: 'HomeForm',
  data() {
    return {
      username_form: '',
      password_form: '',
      loginForm: true
    };
  },
  emits: ['openModalEvent'],
  props: {
    isConnected: Boolean,
    pp_selected: Number
  },
  beforeMount() {
    if (this.isConnected) {
      //get the user id in the session
      this.session = JSON.parse(localStorage.getItem("session"));
      this.username_connected = this.session.user_username;
      this.pp_connected = this.session.user_pp;
    }
  },
  methods: {
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
    },
    login() {
      let username = this.username_form.toLowerCase();
      let password= this.password_form;
      axios.get(`${process.env.VUE_APP_SERVER_API_URL}/users/${username}`).then((response) => {

        if (response.data.length !== 0) {
          let hash = response.data[0].user_password;
          console.log(hash)
          console.log(password)
          if (bcrypt.compareSync(password, hash)) {
            localStorage.setItem('session', JSON.stringify(response.data[0]));
            this.$router.push('/');
            window.location.reload();
          } else {
            alert('Wrong password');
          }
        } else {
          alert('Wrong username');
        }
      }).catch((error) => {
        console.log(error);
      });
    },
    switchForm() {
      this.loginForm = !this.loginForm;
    },
    register() {
      let username = this.username_form.toLowerCase();
      let password = this.password_form;
      let hashedPassword = bcrypt.hashSync(password, salt);
      let avatar = this.pp_selected;
      console.log(avatar)
      if(avatar){
        axios.post(`${process.env.VUE_APP_SERVER_API_URL}/users/create`, JSON.stringify(
                {
                  username: username,
                  password: hashedPassword,
                  avatar: avatar,
                  privilege: 0
                }), {
              headers: {
                'Content-Type': 'application/json'
              }
            }
        ).then((response) => {
          this.loginForm = true;
          localStorage.setItem('session', JSON.stringify({
            username: username,
            password: hashedPassword,
            avatar: avatar,
            privilege: 0
          }));
          this.$router.push('/');
          window.location.reload();
        }).catch((error) => {
          console.log(error);
        });
      }else{
        alert("Please select an avatar")
      }
    },
    play() {
      this.$router.push('/menu');
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
  width: 100%;
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
  box-shadow: 0 0 15px 0 #46cf61;
  transition: 0.2s;
}

form .invalid{
  box-shadow: 0 0 15px 0 #cf4646 !important;
  transition: 0.2s;
}

form input[type="submit"]:hover{
  box-shadow: 0 0 10px 0 #46CDCF;
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

.profile_picture_div{
  position: relative;
  border-radius: 50%;
  cursor: pointer;
}

.edit{
  display:none;
  position: absolute;
  top: 50%;
  right: 50%;
  transform: translate(50%,-50%);
  transition: 0.5s;
  width: 20px;
  height: 20px;
}

.profile_picture_div:hover .profile_picture{
  opacity: 0.5;
  transition: 0.2s;
}

.profile_picture_div:hover .edit{
  display: block;
  transition: 0.2s;
}





.avatar_choose img{
  width: 50px;
  height: 50px;
  border-radius: 50%;
  cursor: pointer;
  transition: 0.5s;
}
</style>