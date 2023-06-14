import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slide"
export default class extends Controller {
  static targets = ["partialContainer", "routeButton"]

  replace(event) {
    fetch(event.currentTarget.dataset.url, {
      method: 'GET',
      headers: { 'Accept': 'text/plain' }
    })
      .then(response => response.text())
      .then((data) => {
        this.partialContainerTarget.classList.add("animate__animated", "animate__slideInUp")
        this.partialContainerTarget.innerHTML = data
      })
  }

}
