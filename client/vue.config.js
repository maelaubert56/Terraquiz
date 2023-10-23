const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
  pluginOptions: {
    electronBuilder: {
      builderOptions: {
        publish: ['VUE_APP_SERVER_API_URL'],
      },
    },
  },
})
