<template>
  <div id="adminpanel">
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
          <input class="search" type="text" placeholder="Search..." v-model="search" @input="search_user">
          <div class="users_list">
            <div v-for="(user, index) in users" class="user" :key="index" @click="this.selected_user = user" :class="this.selected_user === user ? 'selected' : ''">
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
            <div class="privilege">
              <span>{{this.selected_user.user_privilege === 0 ? "User" : this.selected_user.user_privilege === 1 ? "Admin" : "Super Admin"}}</span>
              <img  :style="this.selected_user.user_privilege === 0 ? 'display:none' : ''" :src='this.selected_user.user_privilege === 0 ? "" : this.selected_user.user_privilege === 1 ? require("@/assets/admin_icon.svg") : require("@/assets/superadmin_icon.svg")' alt="privilege">
            </div>
          </span>
          <div class="user_manage_actions_buttons" v-if="this.selected_user !== null">
            <button class="change_privilege" v-if="this.session.user_privilege === 2 && this.selected_user.user_privilege !== 2" @click="this.selected_user.user_privilege === 0 ? update_privilege(this.selected_user, 1) : update_privilege(this.selected_user, 0)">{{this.selected_user.user_privilege === 0 ? "Make Admin" : "Make User"}}</button>
            <button class="delete" v-if="(this.session.user_privilege === 2 && this.selected_user.user_privilege !== 2) ||  (this.session.user_privilege===1 && this.selected_user.user_privilege === 0)" @click="delete_user(this.selected_user)">Delete</button>
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
        nb_registered:0,
        nb_quizzes_answered:0,
      },
      users: [],
      selected_user:null,
      session: null,
      search: "",
    };
  },
  beforeMount() {
    axios.get(`${process.env.VUE_APP_SERVER_API_URL}/users/checkConnection`, { withCredentials: true })
    .then((response) => {
      if (response.status === 200) {
        this.session = response.data;
        if(this.session.user_privilege === 0){
          this.$router.push('/');
        }
        else{
          // get all the users
          axios.get(`${process.env.VUE_APP_SERVER_API_URL}/users`)
          .then((response) => {
            this.users = response.data;
          })
          .catch((error) => {
            console.log(error);
          });

          //get the stats
          axios.get(`${process.env.VUE_APP_SERVER_API_URL}/stats`)
          .then((response) => {
            this.stats = response.data;
          })
        }
      }
      }
    )
    .catch((error) => {
        if (error.response.status === 401) {
          this.$router.push('/');
        }
      }
    );
  },
  methods:{
    search_user(){
      if (this.search === "") {
        axios.get(`${process.env.VUE_APP_SERVER_API_URL}/users`)
        .then((response) => {
          this.users = response.data;
        })
        .catch((error) => {
          console.log(error);
        });
      }
      else {
        axios.get(`${process.env.VUE_APP_SERVER_API_URL}/users/search/${this.search}`)
            .then((response) => {
              this.users = response.data;
            })
            .catch((error) => {
              console.log(error);
            });
      }
    },
    update_privilege(user, privilege){
      if(this.session.user_privilege === 2){
        axios.post(`${process.env.VUE_APP_SERVER_API_URL}/users/update/privilege/${user.user_id}`, {privilege:privilege})
        .then((response) => {
          axios.get(`${process.env.VUE_APP_SERVER_API_URL}/users`)
          .then((response) => {
            this.users = response.data;
            // update the selected user
            this.selected_user = this.users.find((user) => {
              return user.user_id === this.selected_user.user_id;
            })
          })
        })
        .catch((error) => {
          console.log(error);
        });
      }
    },
    delete_user(user){
      if((this.session.user_privilege === 2 && this.selected_user.user_privilege !== 2) ||  (this.session.user_privilege===1 && this.selected_user.user_privilege === 0)){
        axios.post(`${process.env.VUE_APP_SERVER_API_URL}/users/delete/${user.user_id}`)
        .then((response) => {
          axios.get(`${process.env.VUE_APP_SERVER_API_URL}/users`)
          .then((response) => {
            this.users = response.data;
            // update the selected user
            this.selected_user = null;
          })
        })
        .catch((error) => {
          console.log(error);
        });
      }
    }
  }

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
  flex-direction: column;
  gap:20px;
  font-size:20px;
}

.user_manage_actions>span>img{
  width:40%;
  border-radius:50%;
}

.user_manage_actions>span>.privilege{
  font-size: 16px;
  padding:5px 15px;
  box-shadow: 0 0 5px rgba(0,0,0,0.5);
  border-radius:20px;
  display: flex;
  justify-content: center;
  align-items: center;
  gap:10px;
}

.user_manage_actions>span>.privilege>img{
  width:30px;
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
  padding-bottom:10px;
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
  border: 2px solid transparent;
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
  opacity:0.8;
}

.user_manage_list .user:hover{
  background: #48466D;
  box-shadow: 0 0 5px rgba(0,0,0,0.5);
  opacity:1;
  transition:0.2s;
}

.selected{
  background: #48466D !important;
  border: 2px solid #FFC947 !important;
  transform:scale(0.99);
  opacity:1 !important;
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


@media (max-width: 768px) {
  .user_manage_container{
    border-radius:20px;
    flex-direction: column;
    justify-content: flex-start;
    width:90%;
    height: 100%;
    box-shadow: 0 0 20px rgba(0,0,0,0.5);
    overflow: visible;
    padding: 20px 0;
    margin-bottom: 15px;
  }

  .user_manage_container>div{
    margin:0;
    height: fit-content;
  }

  .user_manage_container>div>div{
    box-shadow: none;
    height: fit-content;
  }

  .user_manage_list{
   padding: 20px 0;
  }

  .user_manage_list>input{
    width:70%;
  }

 .user_manage_list>.users_list{
    flex-direction: row;
    flex-wrap: nowrap;
    overflow-y: hidden;
    overflow-x: auto;
   justify-content: flex-start;
   height:fit-content;
   gap:10px;
  }

 .user_manage_list .user{
   padding: 5px 15px;
 }

 .user_manage_list .user:first-child{
   margin-left: 20px;
  }

  .user_manage_list .user:last-child{
    margin-right: 20px;
  }


  .user_manage_actions>span>img{
    width:100px;
  }

  .user_manage_actions_buttons>button{
    width:50%;
  }

  .user_manage_list>.users_list::-webkit-scrollbar {
    width: 0;
    background: transparent;
  }

  .user_manage_list>.users_list::-webkit-scrollbar-thumb {
    width: 0;
    background: transparent;
  }


}

</style>