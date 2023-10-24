<template>
  <ChooseAvatar v-if="!isConnected && isModalVisible" :pp_selected="parseInt(pp_selected)" @chooseAvatarEvent="handleChooseAvatar" @closeModalEvent="handleCloseModal"/>
  <div id="HomePage">
    <img src="../assets/background_mobile.png" alt="Plane" class="plane_mobile">
    <img src="../assets/background_desktop.png" alt="Plane" class="plane_desktop">
    <div>
      <h2>challenge your geography skills</h2>
      <!-- if not connected -->
      <HomeForm :isConnected="isUserConnected" :pp_selected="parseInt(pp_selected)" @openModalEvent="handleOpenModal" />
      <FooterComponent :isConnected="isUserConnected" />
    </div>
  </div>
</template>

<script>
import HomeForm from "@/components/HomeComponents/HomeForm.vue";
import FooterComponent from "@/components/FooterComponent.vue";
import ChooseAvatar from "@/components/HomeComponents/HomeChooseAvatar.vue";
export default {
    name: 'HomeView',
    data() {
      return {
        isModalVisible: false,
        pp_selected: null,
        isConnected: false
      };
    },
    components: {
      ChooseAvatar,
      HomeForm,
      FooterComponent
    },
    beforeCreate() {
      this.isUserConnected = localStorage.getItem("session") !== null;
    },
  methods: {
    handleChooseAvatar(avatarId) {
      this.pp_selected = avatarId;
    },
    handleCloseModal() {
      this.isModalVisible = false;
    },
    handleOpenModal() {
      this.isModalVisible = true;
    }
  }
};


</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
  #HomePage{
    position: relative;
    width: 100%;
    height: 100vh;
    background-color: #48466D;
    color:white;
    font-family: "Concert One", cursive;
  }


  h1 {
    font-weight: normal;
    margin: 0;
    padding: 0;
  }

  #HomePage>div{
    position: absolute;
    bottom:0;
    left: 50%;
    transform: translate(-50%,0);
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;
    width: 100%;
    height: 60%;
  }

  h2{
    text-align: center;
    font-size: 35px;
    letter-spacing: 7.5px;
    font-weight: 400;
  }

  .plane{
    display: none;
  }

  @media screen and (min-width: 768px) {
    .plane_mobile{
      display: none;
    }
    .plane_desktop{
      display: block;
      position: absolute;
      height:100%;
      top:0;
      left:50%;
      transform: translate(-50%, 0);
      max-width: 100%;
      max-height: 100%;
      object-fit: cover;
    }
  }

  @media screen and (max-width: 768px) {
    .plane_mobile{
      display: block;
      position: absolute;
      width:100%;
      top:10%;
      left:50%;
      transform: translate(-50%, 0);
      max-width: 100%;
      max-height: 100%;
      object-fit: cover;
      }
    .plane_desktop{
      display: none;
    }

    h2{
      font-size: 25px;
      letter-spacing: 5px;
      margin: 0 20px;
    }
  }
</style>
