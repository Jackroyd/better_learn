import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "input", "list", "subject", "topic", "level"]

  update() {
    const subjectName = document.querySelectorAll("select")[0]["name"];
    const levelName = document.querySelectorAll("select")[1]["name"];
    const subjectValue = document.querySelectorAll("select")[0]["value"];
    const levelValue = document.querySelectorAll("select")[1]["value"];
    console.log(this.formTarget.action)
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}&${subjectName}=${subjectValue}&${levelName}=${levelValue}`
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data
      })
  }

  filter(e) {
    const subjectName = document.querySelectorAll("select")[0]["name"];
    const levelName = document.querySelectorAll("select")[1]["name"];
    const subjectValue = document.querySelectorAll("select")[0]["value"];
    const levelValue = document.querySelectorAll("select")[1]["value"];
    const searchIn = document.querySelector("input")["value"];
    console.log(searchIn);
    const url = `${this.formTarget.action}?${subjectName}=${subjectValue}&${levelName}=${levelValue}&query=${searchIn}`
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data;
      });

  }
}
