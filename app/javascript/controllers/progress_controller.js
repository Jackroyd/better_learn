import { Controller } from "@hotwired/stimulus"

export default class extends Controller {


  correct(e) {
    const log_id = e.target.closest(".correct").dataset.progressDetailsValue;
    const do_they_know = e.target.closest(".correct").dataset.progressCorrectValue;
    const cards = e.target.closest(".correct").dataset.progressCardsValue;
    const progress_log = e.target.closest(".correct").dataset.progressLogValue;
    const deck_id = e.target.closest(".correct").dataset.progressDeckValue;
    // console.log(do_they_know);
    // console.log(log_id);
    // console.log(cards);
    // console.log(progress_log);
    const data = {log_id: log_id, do_they_know: do_they_know, cards: cards, progress_log: progress_log, deck_id: deck_id};
    const putMethod = {
      method: 'PUT',
      headers: {
      'Content-type': 'application/json; charset=UTF-8'
      },
      body: JSON.stringify(data)
    };

    const knowAfter = document.querySelector(".know-after");
    const knowBefore = document.querySelector(".know-before");
    const dontAfter = document.querySelector(".dont-after");
    const dontBefore = document.querySelector(".dont-before");
    const url = `/progress_log_details/${log_id}`;
    fetch(url, putMethod)
    // .then(response => response.json())
    .then(knowBefore.classList.add("hidden"))
    .then(knowAfter.classList.remove("hidden"))
    .then(dontBefore.classList.remove("hidden"))
    .then(dontAfter.classList.add("hidden"))
    .then(data => console.log(data)) // Manipulate the data retrieved back, if we want to do something with it
    .catch(err => console.log(err));
  }

  incorrect(e) {
    const log_id = e.target.closest(".incorrect").dataset.progressDetailsValue;
    const do_they_know = e.target.closest(".incorrect").dataset.progressCorrectValue;
    const cards = e.target.closest(".incorrect").dataset.progressCardsValue;
    const progress_log = e.target.closest(".incorrect").dataset.progressLogValue;
    const deck_id = e.target.closest(".incorrect").dataset.progressDeckValue;
    // console.log(do_they_know);
    // console.log(log_id);
    // console.log(cards);
    // console.log(progress_log);
    const data = {log_id: log_id, do_they_know: do_they_know, cards: cards, progress_log: progress_log, deck_id: deck_id};
    const putMethod = {
      method: 'PUT',
      headers: {
      'Content-type': 'application/json; charset=UTF-8'
      },
      body: JSON.stringify(data)
    };

    const dontAfter = document.querySelector(".dont-after");
    const dontBefore = document.querySelector(".dont-before");
    const knowAfter = document.querySelector(".know-after");
    const knowBefore = document.querySelector(".know-before");
    const url = `/progress_log_details/${log_id}`;
    fetch(url, putMethod)
    .then(dontBefore.classList.add("hidden"))
    .then(dontAfter.classList.remove("hidden"))
    .then(knowBefore.classList.remove("hidden"))
    .then(knowAfter.classList.add("hidden"))
    // .then(response => response.json())
    .then(data => console.log(data)) // Manipulate the data retrieved back, if we want to do something with it
    .catch(err => console.log(err));
  }

}
