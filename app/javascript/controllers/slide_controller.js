import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slide"
export default class extends Controller {
  static targets = ["partialContainer", "routeButton"]

  replace(event) {
    this.coordinates = event.target.dataset.restroomlnglat
    fetch(event.currentTarget.dataset.url, {
      method: 'GET',
      headers: { 'Accept': 'text/plain' }
    })
      .then(response => response.text())
      .then((data) => {
        this.partialContainerTarget.innerHTML = data
        this.routeButtonTarget.dataset.coordinates = this.coordinates
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
