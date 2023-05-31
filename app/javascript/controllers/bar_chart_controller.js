
import { Controller } from "@hotwired/stimulus"
import {
  Chart,
  initTE,
} from "tw-elements";

// Chart
export default class extends Controller {
  static values = {
    percentage: String,
    title: String
  }

  connect() {
    console.log(this.percentageValue)
    console.log(this.titleValue)
    initTE({ Chart });
    this.dataBarHorizontal = {
      type: "bar",
      data: {
        labels: JSON.parse(this.titleValue),
        datasets: [
          {
            label: [JSON.parse(this.titleValue)],
            data: JSON.parse(this.percentageValue),
            backgroundColor: [
              "rgb(84, 56, 243)",
              "rgb(243, 22, 2)",
            ],
          },
        ],
      },
    };

    this.optionsBarHorizontal = {
      options: {
        indexAxis: "y",
        scales: {
          x: {
            stacked: false,
            grid: {
              display: false,
              borderDash: [2],
              zeroLineColor: "rgba(0,0,0,0)",
              zeroLineBorderDash: [2],
              zeroLineBorderDashOffset: [2],
            },
            ticks: {
              color: "rgba(0,0,0, 0.5)",
            },
          },
          y: {
            stacked: true,
            grid: {
              display: false,
            },
            ticks: {
              color: "rgba(0,0,0, 0.5)",
            },
          },
        },
      },
    };

    new Chart(
      document.getElementById("bar-chart-horizontal"),
      this.dataBarHorizontal,
      this.optionsBarHorizontal
    );
  }
}


