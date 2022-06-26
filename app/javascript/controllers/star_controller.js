import { Controller } from "stimulus"

export default class extends Controller {

  connect() {
    console.log("connected");
  }

  clicked(e) {
    const score = e.target.dataset.score;
    const deck = e.target.dataset.deck;
    const user = e.target.dataset.user;
    document.querySelectorAll(".star").forEach((star) => {
      star.innerHTML = "&#9734;"
      if (star.dataset.score <= score) {
        star.innerHTML = "&#9733;"
      }
    })

    const data = {deck_id: deck, score: score, user_id: user };
    const putMethod = {
      method: 'POST',
      headers: {
      'Content-type': 'application/json; charset=UTF-8'
      },
      body: JSON.stringify(data)
    };

    const url = `/decks/${deck}/ratings`;

    fetch(url, putMethod);
  }
}
