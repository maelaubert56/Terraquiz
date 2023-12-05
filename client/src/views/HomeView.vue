<template>
  <div v-if="loading===0" class="loading">
    <div class="loading__container">
      <h2>Loading...</h2>
    </div>
  </div>
  <ChooseAvatar v-if="!isConnected && isModalVisible" :pp_selected="parseInt(pp_selected)" @chooseAvatarEvent="handleChooseAvatar" @closeModalEvent="handleCloseModal"/>
  <div v-if="loading===2" id="HomePage">
    <img src="../assets/background_mobile.png" alt="Plane" class="plane_mobile">
    <img src="../assets/background_desktop.png" alt="Plane" class="plane_desktop">
    <div>
      <h2>challenge your geography skills</h2>
      <!-- if not connected -->
      <HomeForm :isConnected="isConnected" :pp_selected="parseInt(pp_selected)" @openModalEvent="handleOpenModal" />
      <FooterComponent :isConnected="isConnected" :isAdmin="isAdmin" />
    </div>
  </div>
</template>

<script>
import HomeForm from "@/components/HomeComponents/HomeForm.vue";
import FooterComponent from "@/components/FooterComponent.vue";
import ChooseAvatar from "@/components/HomeComponents/HomeChooseAvatar.vue";
import axios from "axios";
export default {
  name: 'HomeView',
  data() {
    return {
      isModalVisible: false,
      pp_selected: null,
      isConnected: false,
      isAdmin: false,
      loading: 0
    };
  },
  components: {
    ChooseAvatar,
    HomeForm,
    FooterComponent
  },
  beforeMount(){
    let imgsrc = ['background_desktop.png', 'background_mobile.png','eye_close.png','edit.svg','eye_open.png','gear.svg','log-out.svg','github.png']
    let loaded = 0;
    imgsrc.forEach((img)=>{
      let image = new Image();
      image.src = require(`@/assets/${img}`);
      image.onload = ()=>{
        loaded++;
        if(loaded === (imgsrc.length)){
          this.loading ++;
        }
      }
    })

    console.log("temporaire")
    // use the route users/checkConnection to check if the user is connected
    // if the response is 401, the user is not connected so this.isUserConnected = false
    // if the response is 200, the user is connected so this.isUserConnected = true, then we check if the user is admin in the response

    axios.get(`${process.env.VUE_APP_SERVER_API_URL}/users/checkConnection`, { withCredentials: true })
      .then((response) => {
        console.log(response)
        if (response.status === 200) {
          // change localstorage
          localStorage.setItem("session", JSON.stringify(response.data));
          console.log("response.data: " + JSON.stringify(response.data));
          this.isConnected = true;
          this.isAdmin = response.data.user_privilege > 0;
          this.pp_selected = response.data.user_pp;
          this.loading ++;
          console.log(this.loading)
        }
      })
      .catch((error) => {
        if (error.response.status === 401) {
          this.isConnected = false;
          this.isAdmin = false;
          this.loading ++;
        }
      });
    console.log("temporair2e")
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
      console.log('open')
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
