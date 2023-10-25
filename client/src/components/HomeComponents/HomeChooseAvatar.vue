

<template>
  <div class="avatar_modal" @click="this.$emit('closeModalEvent');">
    <div class="avatar_content" @click.stop>
      <h2>Choose your avatar</h2>
      <div class="avatar_list">

        <img v-for="i in 30" :key="i+9" :id="i+9" :src="'/assets/profile_pictures/3D_avatars_pack/' + (i+9) + '.svg'" alt="avatar" class='avatar' @click="chooseAvatar($event.target)">
      </div>
    </div>
  </div>
</template>

<script>


export default {
  name: 'HomeChooseAvatar',
  props: {
    pp_selected: {
      type: Number
    }
  },
  methods: {
    chooseAvatar(avatar) {
      // remove the selected class from all the avatars
      const avatars = document.querySelectorAll('.avatar');
      avatars.forEach(avatar => {
        avatar.classList.remove('selected');
      });
      avatar.classList.add('selected');
      this.$emit('chooseAvatarEvent', avatar.id);
    }
  },
  mounted() {
    // add the selected class to the avatar selected
    const avatar = document.getElementById(this.pp_selected);
    if(avatar){avatar.classList.add('selected');}
  }
}


</script>


<style scoped>




  .avatar_modal {
    position: absolute;
    top: 0;
    width: 100vw;
    height: 100vh;
    background-color: rgba(0,0,0,0.5);
    border-radius: 10px;
    z-index: 10;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .avatar_content {
    position:relative;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: flex-start;
    width: 80%;
    height: 80%;
    background-color: #48466D;
    border-radius: 10px;
    z-index: 50;
    overflow: hidden;
  }

  h2{
    z-index: 100;
    position: absolute;
    top: 0;
    font-family: "Concert One", cursive;
    color: black;
    text-align: center;
    padding: 10px;

    margin-top: 10px;
    background-color: rgba(255, 255, 255, 0.8);
    border-radius: 10px;
  }

  .avatar_list{
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: flex-start;
    box-sizing: border-box;
    overflow-y: scroll;
    padding: 10px;
    padding-top: 80px;
    width: 100%;
    max-height: 100%;
    /* gap on the top before begining to scroll */

  }

  .avatar_list::-webkit-scrollbar {
    width: 5px;
  }

  .avatar_list::-webkit-scrollbar-track {
    background: transparent;
  }

  .avatar_list::-webkit-scrollbar-thumb {
    background: #888;
    border-radius: 10px;
  }

  .avatar {
    width: 80px;
    height: 80px;
    margin: 5px;
    cursor: pointer;
    border-radius: 50%;
    border: 3px solid transparent;
    opacity: 0.6;
    transition: 0.1s;
  }

  .avatar:hover {
    /* border inside the avatar so it doesn't change the size of the avatar */

    opacity: 1;
    transition: 0.1s;
  }

  .selected {
    border: 3px solid white;
    opacity: 1;
    transition: 0.1s;
  }


</style>