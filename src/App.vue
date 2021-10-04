<template>
  <img alt="Vue logo" src="./assets/logo.png">
  <h1>第二个项目测试</h1>
  <h2>服务器测试!!!</h2>
  <h2>脚本构建测试成功</h2>
  <h1 style="color: red">SUCCESS!!!</h1>
  <HelloWorld msg="Welcome to Your Vue.js App"/>
</template>

<script>
import HelloWorld from './components/HelloWorld.vue'

export default {
  name: 'App',
  components: {
    HelloWorld
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
