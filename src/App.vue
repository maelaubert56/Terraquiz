
<script>
import { ref, computed } from 'vue'
import HomePage from './components/HomePage/HomePage.vue'
import MainMenu from './components/MainMenu.vue'
import NotFound from './components/NotFound.vue'

const routes = {
  '/': HomePage,
  '/menu': MainMenu,
  '/404': NotFound
}

export default {
  name: 'App',
  components: {
    HomePage,
    MainMenu,
    NotFound
  },
  setup() {
    const currentRoute = ref(window.location.pathname)
    window.onpopstate = () => {
      currentRoute.value = window.location.pathname
    }
    const currentView = computed(() => routes[currentRoute.value] || NotFound)
    return {
      currentView
    }
  }
}
</script>

<style>

@import url('https://fonts.googleapis.com/css?family=Concert+One');

#app {
  font-family: Concert One, Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;

  background: #48466D;
  color:white;
  width:100%;
  min-height:100vh;
  margin:0;
  padding:0;
}
</style>

<template>
  <component :is="currentView" />
</template>
