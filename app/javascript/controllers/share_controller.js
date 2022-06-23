import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    console.log("share working");
  }

  copy() {
    const copyTextarea = document.querySelector(".copy-text").textContent;
    console.log(copyTextarea);
    navigator.clipboard.writeText(copyTextarea);
  }

  link(e) {
    const copyLink = e.target.dataset.link;
    console.log(copyLink);
    navigator.clipboard.writeText(copyLink);
  }
}
