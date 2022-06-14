import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "input", "list", "subject", "topic", "level"]

  update() {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data
      })
  }

  filter(e) {
    console.log(e.currentTarget.name);
    const url = `${this.formTarget.action}?${e.currentTarget.name}=${e.currentTarget.value}`
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data
      });

  }
}
