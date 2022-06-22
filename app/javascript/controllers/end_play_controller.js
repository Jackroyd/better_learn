import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "next", "contain"]

  connect() {
    // console.log("hello");
    // console.log(this.nextTarget);
  }

  endplay() {
    const active = document.querySelector(".active");
    if(active.classList.contains("end")) {
      this.nextTarget.remove();
      this.containTarget.insertAdjacentHTML("beforeend","<%= render 'cards/end_button', progress_log: @progress_log %>")

    }

  }

}
