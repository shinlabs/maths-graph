<template>
  <div class="graph-wc-container">
    <h1>This will be a graph web component</h1>
    <p>Type of function (continuous / discrete) : </p>
    <p>{{ functionType }}</p>
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator'

@Component
export default class Graph extends Vue {
  @Prop() private functionType!: string;
}
</script>

<style lang="scss" scoped>
p {
  color: red;
}
</style>
