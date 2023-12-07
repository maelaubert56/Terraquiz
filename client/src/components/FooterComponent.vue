<template>
  <footer>
    <img src="@/assets/gear.svg" alt="settings" v-if="isConnected" @click="redirect(0)">
    <img src="@/assets/star_icon.svg" alt="leaderboard" v-if="isConnected" @click="redirect(3)">
    <img src="@/assets/github.png" alt="github" @click="redirect(1)">
    <img src="@/assets/log-out.svg" alt="log-out" v-if="isConnected" @click="logout()">
    <img src="@/assets/tool_picto.svg" alt="admin_panel" v-if="isConnected && isAdmin" @click="redirect(2)">
  </footer>
</template>

<script>
import axios from "axios";

export default {
  name: 'FooterComponent',
  props: {
    isConnected: Boolean,
    isAdmin: Boolean
  },
  methods: {
    redirect(target) {
      switch (target) {
        case 0:
          this.$router.push('/settings');
          break;
        case 1:
          window.open('https://github.com/maelaubert56/terraquiz", "_blank');
          break;
        case 2:
          this.$router.push('/adminpanel');
          break;
        case 3:
          this.$router.push('/scoreboard');
          break;
        default:
          break;
      }
    },
    logout() {
      localStorage.removeItem('session');
      axios.delete(`${process.env.VUE_APP_SERVER_API_URL}/users/logout`, { withCredentials: true });
      if (this.$route.path === '/') {
        window.location.reload();
      } else {
        this.$router.push('/');
      }
    }
  }
}

</script>

<style scoped>

footer{
  width: 100%;
  height: 50px;
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  margin-bottom: 20px;
}

footer img{
  width: 30px;
  height: 30px;
  cursor: pointer;
  transition: all 0.3s ease-in-out;
}

footer img:hover{
  transform: scale(1.1);
  transition: all 0.3s ease-in-out;
}

footer img:first-child:hover{
  transform: rotate(20deg) scale(1.1);
}

</style>
