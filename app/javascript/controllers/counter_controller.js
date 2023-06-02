import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="counter"
export default class extends Controller {
  static targets = ["input"]

  connect() {
    this.inputTarget.value = 1
  }

  increase() {
    if (this.inputTarget.value < 10) {
      this.inputTarget.value = +this.inputTarget.value + 1
    }
  }

  decrease() {
    if (this.inputTarget.value > 1) {
      this.inputTarget.value = +this.inputTarget.value - 1
    }

  }
}
