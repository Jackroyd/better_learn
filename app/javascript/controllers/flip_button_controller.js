import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "button", "card" ]

  flip() {
    console.log("Working")
    console.log(this.cardTarget)
    document.querySelector('.active').firstElementChild.firstElementChild.classList.toggle("is-flipped")
    const active = document.querySelector(".active");
    const finish = document.querySelector(".finish")
    if(active.classList.contains("end")) {
      finish.classList.remove("hidden")
    }
  }
}
