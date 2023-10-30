<template>
  <div id="settings">
    <img src="@/assets/logo.png" alt="logo" @click="() => $router.push('/')" />
    <div>
      <h2>Settings</h2>
      <a href="/">Go back to the home page</a>
    </div>
    <div class="settings-container">
      <div class="settings-container__item">
        <h3>Reset all progress</h3>
        <form @submit.prevent="modal_reset = true">
          <button type="submit">Reset progress</button>
        </form>
      </div>
      <div class="settings-container__item">
        <h3>Delete your account</h3>
        <form @submit.prevent="modal_delete = true">
          <button type="submit">Delete account</button>
        </form>
      </div>
    </div>
  </div>
  <div class="modal_confirm" v-if="modal_reset">
    <div class="modal_confirm__container">
      <h2>Are you sure you want to reset your progress?</h2>
      <div class="modal_confirm__container__buttons">
        <button @click="modal_reset = false">Cancel</button>
        <button @click="resetProgress">Reset</button>
      </div>
    </div>
  </div>
  <div class="modal_confirm" v-if="modal_delete">
    <div class="modal_confirm__container">
      <h2>Are you sure you want to delete your account?</h2>
      <div class="modal_confirm__container__buttons">
        <button @click="modal_delete = false">Cancel</button>
        <button @click="deleteAccount">Delete</button>
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
        modal_delete: false
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
  justify-content: space-around;
  align-items: center;
  padding-bottom: 50px;
  box-sizing: border-box;
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
  width: 200px;
  height: 200px;
  cursor: pointer;
}

.settings-container {
  display: flex;
  flex-direction: column;
  gap: 50px;
}

.settings-container__item {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.settings-container__item h3 {
  font-size: 25px;
  letter-spacing: 5px;
}

.settings-container__item button {
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

.settings-container__item button:hover {
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

.modal_confirm__container {

  width: 500px;
  height: 200px;
  background-color: #48466D;
  display: flex;
  flex-direction: column;
  justify-content: space-evenly;
  align-items: center;
  gap: 20px;
  padding: 20px;
}

.modal_confirm__container h2 {
  font-size: 25px;
  letter-spacing: 5px;
}

.modal_confirm__container__buttons {
  width: 100%;
  display: flex;
  justify-content: space-evenly;
  align-items: center;
}

.modal_confirm__container__buttons button {
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

.modal_confirm__container__buttons button:hover {
  background-color: white;
  color: #48466D;
  transition: 0.3s;
}





</style>