<template>
  <div id="settings">
    <img src="@/assets/logo.png" alt="logo" @click="() => $router.push('/')" />
    <div class="title">
      <h2>Settings</h2>
      <a href="/">Go back to the home page</a>
    </div>
    <div class="container">
      <div class="container_item">
        <h3>Change your password</h3>
        <form @submit.prevent="modal_change = true">
          <input type="password" placeholder="New password" v-model="password" />
          <input type="password" placeholder="Confirm new password" v-model="passwordConfirm" />
          <button type="submit">Change password</button>
        </form>
      </div>
      <div class="subcontainer">
        <div class="container_item">
          <h3>Reset all progress</h3>
          <form @submit.prevent="modal_reset = true">
            <button type="submit">Reset progress</button>
          </form>
        </div>
        <div class="container_item">
        <h3>Delete your account</h3>
        <form @submit.prevent="modal_delete = true">
          <button type="submit">Delete account</button>
        </form>
      </div>
      </div>
    </div>
  </div>
  <div class="modal_confirm" v-if="modal_reset">
    <div class="modal_confirm_container">
      <h2>Are you sure you want to reset your progress?</h2>
      <div class="modal_confirm_container_buttons">
        <button @click="resetProgress">Reset</button>
        <button @click="modal_reset = false">Cancel</button>
      </div>
    </div>
  </div>
  <div class="modal_confirm" v-if="modal_delete">
    <div class="modal_confirm_container">
      <h2>Are you sure you want to delete your account?</h2>
      <div class="modal_confirm_container_buttons">
        <button @click="deleteAccount">Delete</button>
        <button @click="modal_delete = false">Cancel</button>
      </div>
    </div>
  </div>
  <div class="modal_confirm" v-if="modal_change">
    <div class="modal_confirm_container">
      <h2>Are you sure you want to change your password?</h2>
      <div class="modal_confirm_container_buttons">
        <button @click="resetPassword">Change</button>
        <button @click="modal_change = false">Cancel</button>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
    name: 'SettingsPage',
    data() {
      return {
        password: "",
        passwordConfirm: "",
        session: null,
        modal_reset: false,
        modal_delete: false,
        modal_change: false
      };
    },
    created() {
      //check if there is a session
      if (!localStorage.getItem("session")) {
        this.$router.push("/");
      }else {
        //get the user id in the session
        this.session = JSON.parse(localStorage.getItem("session"));
      }
    },
    methods: {
      resetPassword() {
        //get the user id in the session
        let user_id = this.session.user_id;
        //check if the passwords are the same
        if (this.password === this.passwordConfirm) {
          //reset the password
          axios.post(`${process.env.VUE_APP_SERVER_API_URL}/users/update/password/${user_id}`, {
            password: this.password
          }, { withCredentials: true })
              .then((response) => {
            // remove the session
            localStorage.removeItem("session");
            // inform the user
            alert("Your password has been changed. Please log in again.");
            // redirect to the login page
            this.$router.push("/");
          });
        }
      },
      resetProgress() {
        //get the user id in the session
        let user_id = this.session.user_id;
        //reset the progress
        axios.post(`${process.env.VUE_APP_SERVER_API_URL}/quiz/progress/reset/${user_id}`).then((response) => {
          this.$router.push("/");
        });
      },
      deleteAccount() {
        //get the user id in the session
        let user_id = this.session.user_id;
        //delete the account
        axios.post(`${process.env.VUE_APP_SERVER_API_URL}/users/delete/${user_id}`).then((response) => {
          localStorage.removeItem("session");
          this.$router.push("/");
        });
      }
    }
}
</script>

<style scoped>
#settings{
  width: 100%;
  height: 100vh;
  background-color: #48466D;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: center;
  padding-top: 50px;
  padding-bottom: 50px;
  box-sizing: border-box;
  gap:50px;
  overflow-y: scroll;
}

.title{
  text-align: center;
}


h1, h2, h3, a, p{
  font-family: "Concert One", cursive;
  text-align: center;
  margin: 0;
  padding: 0;
  color: white;
}


h2 {
  font-size: 40px;
  letter-spacing: 7.5px;
}

img {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 100px;
  height: 100px;
  cursor: pointer;
}

.container {
  width:80%;
  display: flex;
  flex-direction: row;
  gap: 50px;
}

.container>div{
  width:50%;
}

.subcontainer {
  display: flex;
  flex-direction: column;
  gap: 100px;
}

.container_item {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.container_item form{
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 15px;
}

.container_item input {
  font-size: 19px;
  height: 50px;
  background-color: #48466D;
  border: 2px solid white;
  color: white;
  letter-spacing: 5px;
  padding-left: 10px;
  width:80%;
}

.container_item input:focus {
  outline: none;
}



.container_item h3 {
  font-size: 25px;
  letter-spacing: 5px;
}

.container_item button {
  width: 100%;
  height: 50px;
  background-color: #48466D;
  border: 2px solid white;
  color: white;
  font-size: 20px;
  letter-spacing: 5px;
  cursor: pointer;
  transition: 0.3s;
}

.container_item button:hover {
  background-color: white;
  color: #48466D;
  transition: 0.3s;
}














.modal_confirm {
  width: 100%;
  height: 100vh;
  background-color: rgba(0, 0, 0, 0.5);
  position: fixed;
  top: 0;
  left: 0;
  display: flex;
  justify-content: center;
  align-items: center;
}

.modal_confirm_container {
  width: 100%;
  height: 200px;
  background-color: #48466D;
  display: flex;
  flex-direction: column;
  justify-content: space-evenly;
  align-items: center;
  gap: 20px;
  padding: 20px;
}

.modal_confirm_container h2 {
  font-size: 25px;
  letter-spacing: 5px;
}

.modal_confirm_container_buttons {
  width: 100%;
  display: flex;
  justify-content: space-evenly;
  align-items: center;
}

.modal_confirm_container_buttons button {
  background-color: #48466D;
  border: 2px solid white;
  color: white;
  font-size: 20px;
  letter-spacing: 5px;
  cursor: pointer;
  transition: 0.3s;
  text-align: center;
  padding: 10px;
}

.modal_confirm_container_buttons button:hover {
  background-color: white;
  color: #48466D;
  transition: 0.3s;
}


@media (max-width: 768px) {
  .container {
    flex-direction: column;
    gap: 50px;
  }

  .container>div{
    width:100%;
  }

  .subcontainer {
    gap: 50px;
  }

  .container_item {
    gap: 10px;
  }

  .container_item h3 {
    font-size: 20px;
  }

  .container_item input {
    font-size: 15px;
    height: 40px;
    letter-spacing: 3px;
  }

  .container_item button {
    font-size: 15px;
    height: 40px;
    letter-spacing: 3px;
  }

  .modal_confirm_container h2 {
    font-size: 20px;
    letter-spacing: 3px;
  }

  .modal_confirm_container_buttons button {
    font-size: 15px;
    letter-spacing: 3px;
    padding: 5px;
  }
}

</style>