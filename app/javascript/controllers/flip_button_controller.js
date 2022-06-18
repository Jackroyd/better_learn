import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "button", "card" ]

  connect() {
    console.log("Hello from our first Stimulus controller")
  }

  flip() {
    console.log("Working")
    console.log(this.cardTarget)
    document.querySelector('.active').firstElementChild.firstElementChild.classList.toggle("is-flipped")
    // document.querySelector('.active').previousElementSibling.firstElementChild.firstElementChild.classList.remove("is-flipped")
  }
}
