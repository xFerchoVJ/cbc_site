import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="lazy-load"
export default class extends Controller {
  connect() {
    this.applyLazy();
  }

  applyLazy(){
    const images = document.querySelectorAll("img");
    images.forEach(img => {
      img.setAttribute("loading", "lazy")
    })
  }
}
