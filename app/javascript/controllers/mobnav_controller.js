import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    console.log("mobnav");
  }

  menu() {
    const dropMenu = document.querySelector(".mobile-nav");
    dropMenu.classList.toggle("hidden");
  }
}
