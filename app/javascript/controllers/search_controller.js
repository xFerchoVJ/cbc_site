import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["keyword", "propertyType", "saleOrRent"];

  connect() {
    this.initialPropertyType = this.propertyTypeTarget.value;
    this.initialSaleOrRent = this.saleOrRentTarget.value;
  }

  async search() {
    const keyword = this.keywordTarget.value;
    const propertyType = this.propertyTypeTarget.value;
    const saleOrRent = this.saleOrRentTarget.value;

    const formData = new FormData();
    formData.append("keyword", keyword);
    formData.append("property_type", propertyType);
    formData.append("sale_or_rent", saleOrRent);

    try {
      const response = await fetch("/properties/filter", {
        method: "POST",
        body: formData,
      });

      if (response.ok) {
        const html = await response.text();
        this.element.innerHTML = html;

        // Restablece los valores seleccionados
        this.propertyTypeTarget.value = this.initialPropertyType;
        this.saleOrRentTarget.value = this.initialSaleOrRent;
      }
    } catch (error) {
      console.error(error);
    }
  }
}
