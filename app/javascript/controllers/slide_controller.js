import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slide"
export default class extends Controller {
  static targets = ["partialContainer"]

  replace(event) {
    fetch(event.currentTarget.dataset.url, {
      method: 'GET',
      headers: { 'Accept': 'text/plain' }
    })
      .then(response => response.text())
      .then((data) => {
        this.partialContainerTarget.innerHTML = data
      })
  }

  slideUp() {
    // Animation code goes here
    this.showTarget.classList.remove("d-none")
    this.showTarget.classList.add("animate__animated", "animate__slideInUp")
  }

  slideOutDown() {
    this.showTarget.classList.add("d-none")
    this.showTarget.classList.add("animate__animated", "animate__slideOutDown")
  }

}
