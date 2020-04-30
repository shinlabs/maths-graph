<script lang="ts">
import { Line } from 'vue-chartjs'
import { Component, Prop, Vue } from 'vue-property-decorator'
import { ChartData, ChartOptions, ChartConfiguration } from 'chart.js'

@Component({
  extends: Line
})
export default class LineChart extends Vue {
  @Prop() chartConfig!: ChartConfiguration;

  mounted () {
    if (this.chartConfig.data && this.chartConfig.options) {
      this.renderChart(this.chartConfig.data, this.chartConfig.options)
    }
  }

  /**
   * Little hack because there are issues in `vue-chartjs` package with TypeScript projects
   * See https://github.com/apertureless/vue-chartjs/issues/313
   */
  renderChart!: (chartData: ChartData, options: ChartOptions) => void;
}
</script>
