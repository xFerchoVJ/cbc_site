import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
  connect() {
    this.showNavbar('#header-toggle', '#nav-bar', '#body-pd', '#header')
    this.links();
  }


  links() {
    /*===== LINK ACTIVE =====*/
    const linkColor = document.querySelectorAll('.nav_link')
    function colorLink() {
      if (linkColor) {
        linkColor.forEach(l => l.classList.remove('active'))
        this.classList.add('active')
      }
    }
    linkColor.forEach(l => l.addEventListener('click', colorLink))
  }

  showNavbar(toggleId, navId, bodyId, headerId) {
    const toggle = document.querySelector(toggleId),
      nav = document.querySelector(navId),
      bodypd = document.querySelector(bodyId),
      headerpd = document.querySelector(headerId)
    // Validate that all variables exist
    if (toggle && nav && bodypd && headerpd) {
      toggle.addEventListener('click', () => {
        // show navbar
        nav.classList.toggle('show')
        // change icon
        toggle.classList.toggle('bx-x')
        // add padding to body
        bodypd.classList.toggle('body-pd')
        // add padding to header
        headerpd.classList.toggle('body-pd')
      })
    }
  }
}
