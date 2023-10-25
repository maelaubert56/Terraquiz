<template>
  <footer>
    <img src="@/assets/gear.svg" alt="settings" v-if="isConnected" @click="redirect(0)">
    <img src="@/assets/github.png" alt="github" @click="redirect(1)">
    <img src="@/assets/log-out.svg" alt="log-out" v-if="isConnected" @click="logout()">
  </footer>
</template>

<script>
export default {
  name: 'FooterComponent',
  props: {
    isConnected: Boolean
  },
  methods: {
    redirect(target) {
      // Redirigez vers la page du menu
      if (target === 0) {
        this.$router.push('/settings');
      } else if (target === 1) {
        window.open('https://github.com/maelaubert56/terraquiz", "_blank');
      }
    },
    logout() {

      localStorage.removeItem('session');
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
