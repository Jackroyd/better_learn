import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "navlink" ]

  connect() {
    const activePage = window.location.pathname;
    var activeP = activePage.match(/[^\/]+$/);
    activeP = (activeP == null) ? ['home'] : activeP;
    console.log(activeP[0]);

    this.navlinkTargets.forEach(li => {
      var navP = li.href.match(/[^\/]+$/);
      navP = (navP == null) ? ['home'] : navP;
      console.log(navP[0]);
      if(navP[0] == activeP[0]) {
        li.classList.add('nav-active');
      }
    })
  }
}
