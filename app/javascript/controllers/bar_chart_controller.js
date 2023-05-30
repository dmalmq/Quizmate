// import { Controller } from "@hotwired/stimulus"
// import {
//   Chart,
//   initTE,
// } from "tw-elements";
//
// // Connects to data-controller="bar-chart"
// export default class extends Controller {
//   static values = {
//     percentage: String,
//     title: String
//   }
//   connect() {
//     console.log(this.percentageValue)
//     console.log(this.titleValue)
//     initTE({ Chart });
//     this.dataBarCustomOptions = {
//       type: "bar",
//       data: {
//         labels: JSON.parse(this.titleValue),
//         datasets: [
//           {
//             label: "performance by interest",
//             data: JSON.parse(this.percentageValue),
//             backgroundColor: [
//               "rgba(255, 99, 132, 0.2)",
//               "rgba(54, 162, 235, 0.2)",
//               "rgba(255, 206, 86, 0.2)",
//               "rgba(75, 192, 192, 0.2)",
//               "rgba(153, 102, 255, 0.2)",
//               "rgba(255, 159, 64, 0.2)",
//             ],
//             borderColor: [
//               "rgba(255,99,132,1)",
//               "rgba(54, 162, 235, 1)",
//               "rgba(255, 206, 86, 1)",
//               "rgba(75, 192, 192, 1)",
//               "rgba(153, 102, 255, 1)",
//               "rgba(255, 159, 64, 1)",
//             ],
//             borderWidth: 1,
//           },
//         ],
//       },
//     };
//     this.optionsBarCustomOptions = {
//       options: {
//         plugins: {
//           legend: {
//             position: "top",
//             labels: {
//               color: "green",
//             },
//           },
//         },
//         scales: {
//           x: {
//             ticks: {
//               color: "#4285F4",
//             },
//           },
//           y: {
//             ticks: {
//               color: "#f44242",
//             },
//           },
//         },
//       },
//     };
//     new Chart(
//       document.getElementById("bar-chart-custom-options"),
//       this.dataBarCustomOptions,
//       this.optionsBarCustomOptions
//     );
//   }
//
//
// }
