import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="calendar"
export default class extends Controller {

  connect() {
    this.initFlatpickr()
  }

  initFlatpickr() {

    const dates = JSON.parse(this.element.dataset.dates);
    console.log(dates);
    flatpickr(this.element, {
      enableTime: false,
      minDate: 'today',
      onClose: (selectedDates, dateStr, instance) => {
        this.element.value = dateStr;
      },
      disable: dates,
      locale: {
        weekdays: {
          shorthand: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
          longhand: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
        },
        months: {
          shorthand: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Оct', 'Nov', 'Dic'],
          longhand: ['Enero', 'Febreo', 'Мarzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        },
      },
    })
  }
}
