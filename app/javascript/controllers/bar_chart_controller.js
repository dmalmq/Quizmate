import { Controller } from "@hotwired/stimulus";
import Chart from "chart.js/auto";

export default class extends Controller {
  static values = {
    percentage: String,
    title: String
  }

  connect() {
    console.log(this.percentageValue);
    console.log(this.titleValue);

    this.dataBarHorizontal = {
      type: "bar",
      data: {
        labels: JSON.parse(this.titleValue),
        datasets: [
          {

            data: JSON.parse(this.percentageValue),
            backgroundColor: [
              createGradient("rgb(105, 255, 151)", "rgb(0, 228, 255)"),
            ],
            borderRadius: 10,
          },
        ],
      },
    };

    this.optionsBarHorizontal = {
      plugins: {
        legend: {
          display: false,
          labels: {
            color: 'white',
          }
        },
      },

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
          // ticks: {
          //   color: "#581FAF",
          // },
          ticks: {
            // color: "rgba(255,255, 255)",
            display: false,
            // callback: function (value, index, ticks) {
            //   return "";
            // },
          },
        },
        y: {
          stacked: true,
          grid: {
            display: false,
          },
          ticks: {
            color: "rgba(255,255, 255)",
            // display: false,
          },
        },
      },
    };

    const ctx = document.getElementById("bar-chart-horizontal").getContext("2d");
    new Chart(ctx, {
      type: this.dataBarHorizontal.type,
      data: this.dataBarHorizontal.data,
      options: this.optionsBarHorizontal,
    });
  }
}

function createGradient(color1, color2) {
  const ctx = document.createElement("canvas").getContext("2d");
  const gradient = ctx.createLinearGradient(0, 0, 0, 100);
  gradient.addColorStop(0, color1);
  gradient.addColorStop(1, color2);
  return gradient;
}
