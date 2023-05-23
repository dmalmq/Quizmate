import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["dropdown"];

  connect() {
    console.log("menu connected")
  }

  toggleDropdown() {
    console.log(this)
    this.dropdownTarget.classList.toggle("hidden")
  }
}
