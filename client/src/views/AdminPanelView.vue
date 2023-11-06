<template>
  <div id="adminpanel">
    {{console.log('hello')}}
    <img src="@/assets/logo.png" alt="logo" @click="() => $router.push('/')" />
    <div class="stats_container">
      <div class="nb_registered">
        <span>{{this.stats.nb_registered}}</span>
        <p>Registered</p>
      </div>
      <h2>Stats</h2>
      <div class="nb_answered_quizzes">
        <span>{{this.stats.nb_quizzes_answered}}</span>
        <p>Quizzes Answered</p>
      </div>
    </div>
    <div class="user_manage_container">
      <div class="left">
        <div class="user_manage_list">
          <input class="search" type="text" placeholder="Search...">
          <div class="users_list">
            <div v-for="(user, index) in users" class="user" :key="index" @click="this.selected_user = user">
              <img :src='"/assets/profile_pictures/3D_avatars_pack/"+user.user_pp+".svg"' alt="profilepicture">
              <p>{{user.user_username}}</p>
              <img class="privilege" :style="user.user_privilege === 0 ? 'opacity:0' : ''"
                   :src='user.user_privilege === 0 ? "" : user.user_privilege === 1 ? require("@/assets/admin_icon.svg") : require("@/assets/superadmin_icon.svg")' alt="privilege">
            </div>
          </div>
        </div>
      </div>
      <div class="right">
        <div class="user_manage_actions">
          <span v-if="this.selected_user !== null">
            <img :src='"/assets/profile_pictures/3D_avatars_pack/"+this.selected_user.user_pp + ".svg"' alt="profilepicture">
            <p>{{this.selected_user.user_username}}</p>
            <span>{{this.selected_user.user_privilege === 0 ? "User" : this.selected_user.user_privilege === 1 ? "Admin" : "Super Admin"}}</span>
            <img class="privilege" :style="this.selected_user.user_privilege === 0 ? 'opacity:0' : ''" :src='this.selected_user.user_privilege === 0 ? "" : this.selected_user.user_privilege === 1 ? require("@/assets/admin_icon.svg") : require("@/assets/superadmin_icon.svg")' alt="privilege">
          </span>
          <div class="user_manage_actions_buttons" v-if="this.selected_user !== null">
            <button class="change_privilege">Upgrade</button>
            <button class="delete">Delete</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

import axios from 'axios';
export default {
  name: 'AdminPanel',
  data() {
    return {
      stats:{
        nb_registered:50,
        nb_quizzes_answered:130,
      },
      users: [],
      selected_user:null
    };
  },
  beforeCreate() {
    if (!localStorage.getItem("session")) {
      this.$router.push("/");
    } else {
      this.session = JSON.parse(localStorage.getItem("session"));
      if (this.session.user_privilege === 0) {
        this.$router.push("/");
      }
      else{
        // get all the users
        axios.get(`${process.env.VUE_APP_SERVER_API_URL}/users`)
        .then((response) => {
          this.users = response.data;
          console.log(this.users)
        })
        .catch((error) => {
          console.log(error);
        });
      }
    }
  },

}

</script>

<style scoped>

#adminpanel{
  width: 100%;
  height: 100vh;
  //overflow: hidden;
  background-color: #48466D;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: center;
  gap:20px;
  box-sizing: border-box;
}

h1, h2, h3, a, p, span{
  font-family: "Concert One", cursive;
  text-align: center;
  margin: 0;
  padding: 0;
  color: white;
}

#adminpanel>img {
  display: block;
  margin-left: auto;
  margin-right: auto;
  margin-top:25px;
  width: 75px;
  height: 75px;
  cursor: pointer;
}

.stats_container{
  width:100%;
  display: flex;
  flex-direction:row;
  justify-content: space-evenly;
  align-items: center;
}

.stats_container>div{
  width: 20%;
  padding:15px 20px;
  border-radius:20px;
  box-shadow: 0 0 20px rgba(0,0,0,0.5);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.stats_container>div>span{
  font-size:23px;
}

.stats_container>div>p{
  font-size:15px;
}




.user_manage_container{
  padding-top:25px;
  padding-bottom: 50px;
  width:100%;
  display:flex;
  justify-content: center;
  align-items: flex-start;
  overflow: hidden;
}

.user_manage_container>div{
  height: 100%;
  width:100%;
  margin:0 50px;
}

.user_manage_actions{
  height: 100%;
  padding:20px;
  border-radius:20px;
  box-shadow: 0 0 20px rgba(0,0,0,0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  gap:30px;
  flex-direction: column;
}

.user_manage_actions>span{
  display:flex;
  justify-content: center;
  align-items: center;
  gap:20px;
}

.user_manage_actions>span>img{
  width:40px;
  height: 40px;
  border-radius:50%;
}

.user_manage_actions_buttons{
  display: flex;
  gap:10px;
  width:100%;
  justify-content: center;
}

.user_manage_actions_buttons>button{
  width:30%;
  border-radius:20px;
  padding: 10px;
  border:none;
  box-shadow: 0 0 5px rgba(0,0,0,0.5);
  transition:0.2s;
  cursor: pointer;
}

.user_manage_actions_buttons>button:hover{
  transform:scale(0.95);
  opacity:0.9;
  transition:0.2s
}

.user_manage_list{
  padding:20px;
  border-radius:20px;
  box-shadow: 0 0 20px rgba(0,0,0,0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  gap:20px;
  flex-direction: column;
  height: 100%;
  overflow: hidden;
}

.user_manage_list>input{
  width:90%;
  border-radius:20px;
  padding: 10px;
  border:none;
  box-shadow: 0 0 5px rgba(0,0,0,0.5);
  transition:0.2s;
  cursor: pointer;
}

.user_manage_list>.users_list{
  padding-top:10px;
  width: 100%;
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  justify-content: center;
  gap: 20px;
  overflow-y: auto;
}

.user_manage_list>.users_list::-webkit-scrollbar {
  width: 5px;
  background: transparent; /* make scrollbar transparent */
}

.user_manage_list>.users_list::-webkit-scrollbar-thumb {
  background: #5E5C89;
  border-radius: 10px;
}



.user_manage_list .user{
  padding: 10px 0;
  background: #5E5C89;
  width:28%;
  display:flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  border-radius:20px;
  gap:5px;
  transition:0.2s;
}

.user_manage_list .user:hover{
  background: #48466D;
  box-shadow: 0 0 5px rgba(0,0,0,0.5);
  opacity:0.6;
  transform:scale(0.99);
  transition:0.2s;
}
.user_manage_list .user>img{
  width:50px;
  height:50px;
}

.user_manage_list .user>.privilege{
  width:20px;
  height:20px;
}

.user_manage_list .user>span{
  height: 30px;
}

</style>