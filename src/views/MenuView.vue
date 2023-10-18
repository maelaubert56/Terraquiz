<template>
  <div id="MenuPage">
    <img class="logo" :src="LogoSmall" alt="logo"/>

    <div class="Menu">
      <CategoryCard />
      <CategoryCard />
      <CategoryCard />

    </div>

    <FooterComponent :isConnected="true" />
  </div>
</template>

<script>

import CategoryCard from "@/components/MenuComponents/CategoryCard.vue";
import FooterComponent from "@/components/FooterComponent.vue";

export default {
  name: 'MenuPage',
  data() {
    return {
      LogoSmall: require("@/assets/logo_terraquiz.svg"),
    };
  },
  components: {
    CategoryCard,
    FooterComponent
  },
};

</script>


<style scoped>

#MenuPage{
  position: relative;
  width: 100%;
  height: 100vh;
  background-color: #48466D;
  color:white;
  font-family: "Concert One", cursive;
}

.logo{
  /*centered on top of page*/
  position: relative;
  left: 50%;
  transform: translate(-50%,0);
  height: 100px;
  margin: 20px auto;

}

.Menu{
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
  gap: 20px;
}


</style>
