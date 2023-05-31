import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["flipper"]
  connect() {

  }

  // toggleActive(event) {
  //   event.preventDefault();
  //   this.element.classList.toggle("active");
  //   this.element.querySelectorAll(".wrap, a").forEach((element) => {
  //     element.classList.toggle("active");
  //   });
  // }

}
