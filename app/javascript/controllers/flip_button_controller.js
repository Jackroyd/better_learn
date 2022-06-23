import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "button", "card" ]

  flip() {
    document.querySelector('.active').firstElementChild.firstElementChild.classList.toggle("is-flipped")
  }

  stats(e) {
    const card = e.target.closest(".flash-card")
    card.classList.toggle("is-flipped")
  }
}
