import { Controller } from "@hotwired/stimulus"

export default class extends Controller {


  connect() {
    console.log("Hello from our progress controller");
    console.log(this.data.get("cardValue"));
    console.log(this.data.get("logValue"));
    console.log(this.data.get("incorrectValue"));
  }

  // correct() {
  //   await axios({
  //     method: 'put',
  //     url: `/progress_log_details/${card.id}`,
  //     data: {
  //         title: 'Making PUT Requests with Axios',
  //         status: 'published'
  //     }
  // });

  // }

  incorrect() {
    const card_id = this.data.get("cardValue");
    const progress_log_id = this.data.get("logValue");
    const do_they_know = this.data.get("incorrectValue");
    const axios = require('axios');
    const res = axios({
                        method: 'put',
                        url: `/progress_log_details/32`,
                        data: {
                            card_id: card_id,
                            progress_log_id: progress_log_id,
                            do_they_know: do_they_know
                        }
                      });
  }
}
