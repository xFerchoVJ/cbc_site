import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="calendar"
export default class extends Controller {
  connect() {
    this.initFlatpickr()
  }

  initFlatpickr() {
    const dates = JSON.parse(this.element.dataset.dates);
    const today = new Date();
    const minDate = today.toISOString().split('T')[0]; // Convierte la fecha actual a formato YYYY-MM-DD
    const alert = document.querySelector('#warning-dates');
    const button = document.querySelector("#input-button");
    flatpickr(this.element, {
      enableTime: true,
      minDate,
      onClose: (selectedDates, dateStr, instance) => {
        dates.forEach(date => { 
          const dateObject = new Date(date)
          if (selectedDates[0].toLocaleString() == dateObject.toLocaleString()) {
            alert.classList.remove('d-none')
            button.disabled = true
            setTimeout(() => {
              alert.classList.add('d-none')
            }, 6500);
          }else{
            alert.classList.add('d-none')
            button.disabled = false
          }
        })
        this.element.value = dateStr;
      },
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
