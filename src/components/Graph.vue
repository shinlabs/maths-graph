<template>
  <div class="graph-wc-container">
    <h1>This will be a graph web component</h1>
    <p>Type of function (line / other) : </p>
    <p>{{ functionType }}</p>
    <div class="chart-container">
      <LineChart :chartConfig=planetChart></LineChart>
    </div>
  </div>
</template>

<script lang="ts">
import { Component, Prop, Vue } from 'vue-property-decorator'
import { ChartConfiguration, ChartAnimationParameter } from 'chart.js'
import LineChart from '@/components/charts/LineChart.vue'

@Component({
  components: { LineChart }
})
export default class Graph extends Vue {
  @Prop() private functionType!: string;

  ACCEPTED_LABELS = [-10, -5, 0, 1, 5, 10];
  X_COORD = [
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
          data: this.X_COORD.map(x => { return { x, y: 1 / x } }),
          borderWidth: 2,
          borderColor: '#f00',
          fill: false,
          pointRadius: 0
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
            suggestedMax: 10,
            stepSize: 1,
            callback: this.ticksToPrint,
            maxRotation: 0
          },
          gridLines: {
            zeroLineColor: '#000'
          }
        }],
        yAxes: [{
          ticks: {
            stepSize: 1,
            callback: this.ticksToPrint
          },
          gridLines: {
            zeroLineColor: '#000'
          }
        }]
      }
    }
  }

  ticksToPrint (value: any, index: any, values: any) {
    return this.ACCEPTED_LABELS.includes(value) ? value : ''
  }
}
</script>

<style lang="scss" scoped>
p {
  color: red;
}

.chart-container {
  margin: auto;
  width: 40%;
  height: 40%;
}
</style>
