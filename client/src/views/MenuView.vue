<template>
  <div id="Page">
    <img class="logo" :src="LogoSmall" alt="logo" @click="() => $router.push('/')" />

    <div class="Menu" v-if="categories && categories.length > 0">
      <CategoryCard
          v-for="(category, index) in categories"
          :key="index"
          :category="category.category_name"
          :image="category.category_image"
          :score="parseInt(category.progress_value)"
          @click.prevent="goToGameMenu()"
      />
    </div>

    <FooterComponent :isConnected="true" />
  </div>
</template>

<script>

import CategoryCard from "@/components/MenuComponents/CategoryCard.vue";
import FooterComponent from "@/components/FooterComponent.vue";
import axios from 'axios';

export default {
  name: 'MenuPage',
  data() {
    return {
      categories: [],
      LogoSmall: require("@/assets/logo_terraquiz.svg")
    };
  },
  components: {
    CategoryCard,
    FooterComponent
  },
  beforeMount() {
    //check if there is a session
    if (!localStorage.getItem("session")) {
      this.$router.push("/");
    }else {
      //get the user id in the session
      this.session = JSON.parse(localStorage.getItem("session"));
      let user_id = this.session.user_id;
      //get all the cat data from the user id
      axios.get(`${process.env.VUE_APP_SERVER_API_URL}/categories/${user_id}`).then((response) => {
        this.categories = response.data;
      });
    }


  },
  methods: {
    goToGameMenu() {
      this.$router.push("/menu-game");
    }
  },
};

</script>


<style scoped>

#Page{
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-direction: column;
  width: 100%;
  min-height: 100vh;
  background-color: #48466D;
  color:white;
  font-family: "Concert One", cursive;
}

.logo{
  height: 100px;
  margin: 20px auto;
  cursor: pointer;
}

.Menu{
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
  gap: 20px;
}


</style>
