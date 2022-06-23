import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "next-btn" ]

  connect() {
    console.log("play connected");
  }

  next() {
    console.log("clicked next");
    const cards = document.querySelectorAll(".carousel__item");
    const nextLine = document.querySelector(".next-line");
    const nextText = document.querySelector(".next-text");
    const prevLine = document.querySelector(".pre-line");
    const prevText = document.querySelector(".prev-text");
    const endBtn = document.querySelector(".finish");
    cards.forEach((card, index) => {
      card.dataset.pos = parseInt(card.dataset.pos) - 1
      card.classList.remove("active")
      card.classList.remove("hidden")
      if (card.dataset.pos == "0") {
        card.classList.add("active")
      }
      if (parseInt(card.dataset.pos) > 2 || parseInt(card.dataset.pos) < -2 ) {
        card.classList.add("hidden")
      }
      if (card.classList.contains("active") && card.classList.contains("end")) {
        nextLine.classList.add("hidden")
        nextText.classList.add("hidden")
        endBtn.classList.remove("hidden")
      }
      if (card.classList.contains("active") && card.classList.contains("second")) {
        prevLine.classList.remove("hidden")
        prevText.classList.remove("hidden")
      }
    });

  }

  prev() {
    console.log("clicked prev");
    console.log("clicked next");
    const cards = document.querySelectorAll(".carousel__item");
    const nextLine = document.querySelector(".next-line");
    const nextText = document.querySelector(".next-text");
    const prevLine = document.querySelector(".pre-line");
    const prevText = document.querySelector(".prev-text");
    cards.forEach((card, index) => {
      card.dataset.pos = parseInt(card.dataset.pos) + 1
      card.classList.remove("active")
      card.classList.remove("hidden")
      if (card.dataset.pos == "0") {
        card.classList.add("active")
      }
      if (parseInt(card.dataset.pos) > 2 || parseInt(card.dataset.pos) < -2 ) {
        card.classList.add("hidden")
      }
      if (card.classList.contains("active") && card.classList.contains("penultimate")) {
        nextLine.classList.remove("hidden")
        nextText.classList.remove("hidden")
      }
      if (card.classList.contains("active") && card.classList.contains("first")) {
        prevLine.classList.add("hidden")
        prevText.classList.add("hidden")
      }
    });
  }
}
