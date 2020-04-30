<template>
  <div class="graph-wc-container">
    <h1>This will be a graph web component</h1>
    <p>Type of function (line / other) : </p>
    <p>{{ functionType }}</p>
    <LineChart :chartConfig=planetChart></LineChart>
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator'
import { ChartConfiguration } from 'chart.js'
import LineChart from '@/components/charts/LineChart.vue'

@Component({
  components: { LineChart }
})
export default class Graph extends Vue {
  @Prop() private functionType!: string;

  xCoordinates = [
    // negative values
    -10, -9, -8, -7, -6, -5, -4, -3, -2, -1,
    -1 / 2, -1 / 3, -1 / 4, -1 / 5, -1 / 6, -1 / 7, -1 / 8, -1 / 9, -1 / 10,
    0,
    // positive values
    1 / 10, 1 / 9, 1 / 8, 1 / 7, 1 / 6, 1 / 5, 1 / 4, 1 / 3, 1 / 2,
    1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  ];

  planetChart: ChartConfiguration = {
    type: this.functionType,
    data: {
      datasets: [
        {
          label: 'f(x) = 1/x',
          data: this.xCoordinates.map(x => { return { x, y: 1 / x } }),
          borderColor: new Array(39).fill('#36495d'),
          borderWidth: 3,
          fill: false
        }
      ]
    },
    options: {
      responsive: true,
      scales: {
        xAxes: [{
          type: 'linear',
          ticks: {
            suggestedMin: -10,
            suggestedMax: 10
          }
        }]
      }
    }
  }
}
</script>

<style lang="scss" scoped>
p {
  color: red;
}
</style>
