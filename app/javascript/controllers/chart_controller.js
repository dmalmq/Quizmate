import { Controller } from "@hotwired/stimulus"
import {
  Chart,
  initTE,
} from "tw-elements";



// Connects to data-controller="chart"
export default class extends Controller {
  connect() {
    console.log("chart")
    initTE({ Chart });
  }
}
