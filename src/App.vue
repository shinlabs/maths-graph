<template>
  <div id="app">
    <img alt="Vue logo" src="./assets/logo.png">
    <Graph functionType="line"/>
    <HelloWorld msg="Welcome to Your Vue.js + TypeScript App"/>
  </div>
</template>

<script lang="ts">
import { Component, Vue } from 'vue-property-decorator'
import Graph from './components/Graph.vue'
import HelloWorld from './components/HelloWorld.vue'

@Component({
  components: {
    Graph,
    HelloWorld
  }
})
export default class App extends Vue {}
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
