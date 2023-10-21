import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="property-spinner"
export default class extends Controller {
  static target = ['image']
  connect() {
    console.log('spinner controller');
  }

  showSpinner() {
    this.propertyItemTargets.forEach((propertyItem) => {
      propertyItem.classList.add("d-none");
    });
  }

  hideSpinner() {
    this.propertyItemTargets.forEach((propertyItem) => {
      propertyItem.classList.remove("d-none");
    });
  }
}
