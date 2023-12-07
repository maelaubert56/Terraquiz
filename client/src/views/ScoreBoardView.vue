<template>
  <div id="ScoreBoard">
    <img src="@/assets/logo.png" alt="logo" @click="() => $router.push('/')" />
    <div class="leaderboard">
      <div class="leaderboard_header">
        <h2>Leaderboard</h2>
      </div>
      <div class="leaderboard_list">
        <!-- add the class me to the user if it's the current user -->
        <div v-for="(user, index) in users" class="user" :key="index" :class="this.session.user_id === user.user_id ? 'me' : ''">
          <div class="user_rank">
            <span>{{index+1}}</span>
          </div>
          <img :src='"/assets/profile_pictures/3D_avatars_pack/"+user.user_pp+".svg"' alt="profilepicture">
          <p>{{user.user_username}}</p>
          <div class="user_score">
            <!-- round the score to 1 -->
            <span>{{Math.round(user.score*100)/100}}%</span>
          </div>
        </div>
        <div v-if="this.users.length === 0" class="no_user">
          <p>No user found with a score yet</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>

import axios from 'axios';
export default {
  name: 'ScoreBoard',
  data() {
    return {
      users: [],
      session: null
    }
  },
  methods: {
    get_users(){
      axios.get(`${process.env.VUE_APP_SERVER_API_URL}/users/scoreboard`)
      .then((response) => {
        this.users = response.data.filter(user => user.score > 0);
      })
      .catch((error) => {
        console.log(error);
      });
    },
  },
  mounted(){
    axios.get(`${process.env.VUE_APP_SERVER_API_URL}/users/checkConnection`, { withCredentials: true })
        .then((response) => {
            if (response.status === 200) {
              this.session = response.data;
              this.get_users();
            }
          })
        .catch((error) => {
            if (error.response.status === 401) {
              this.$router.push('/');
            }
          });
  }
}

</script>

<style scoped>

#ScoreBoard{
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

#ScoreBoard>img {
  display: block;
  margin-left: auto;
  margin-right: auto;
  margin-top:25px;
  width: 75px;
  height: 75px;
  cursor: pointer;
}

.leaderboard{
  width:40%;
  max-height: 70vh;
  border-radius: 20px;
  box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.75);
  margin: 30px;
  box-sizing: border-box;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: center;
}

.leaderboard_header{
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  border-bottom: 1px solid #5E5C89;
  box-sizing: border-box;
}

.leaderboard_header>h2{
  font-size: 2rem;
  margin: 20px;
}

.leaderboard_list{
  width: 100%;
  height: 100%;
  overflow-y: scroll;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: center;
  gap: 10px;
  padding: 10px;
  box-sizing: border-box;
}

.leaderboard_list::-webkit-scrollbar {
  width: 5px;
  background: transparent; /* make scrollbar transparent */
}

.leaderboard_list::-webkit-scrollbar-thumb {
  background: #5E5C89;
  border-radius: 10px;
}

.user{
  width: 100%;
  display: flex;
  justify-content: flex-start;
  align-items: center;
  gap: 10px;
  padding: 10px;
  box-sizing: border-box;
  border-radius: 20px;
  border: 2px solid transparent;
  transition: 0.2s;
  cursor: pointer;
}

.user.me{
  border: 2px solid #5E5C89;
}

.user:hover{
    background-color: #5E5C89;

}

.user_rank{
  width: 10%;
  display: flex;
  justify-content: center;
  align-items: center;
}

.user_rank>span{
  font-size: 1.5rem;
}

.user>img{
  width: 40px;
  height: 40px;
  border-radius: 50%;
}

.user>p{
  width: 50%;
  font-size: 1.5rem;
}

.user_score{
  width: 30%;
  display: flex;
  justify-content: center;
  align-items: center;
}

.user_score>span{
  font-size: 1.5rem;
}

</style>