import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slide"
export default class extends Controller {
  static targets = ["partialDiv", "slidingDiv"]

  connect() {

  }

  slideUp() {
    // Animation code goes here
    this.partialDivTarget.classList.add("d-none")
    this.slidingDivTarget.classList.remove("d-none")
    this.slidingDivTarget.classList.remove("animate__animated", "animate__slideOutDown")
    this.slidingDivTarget.classList.add("animate__animated", "animate__slideInUp")
  }

  slideOutDown() {
    this.slidingDivTarget.classList.add("animate__animated", "animate__slideOutDown")
    setInterval(() => {
      this.slidingDivTarget.classList.add("d-none")
    }, 1000)
    this.partialDivTarget.classList.remove("d-none")
  }
}
