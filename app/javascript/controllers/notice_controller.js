import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const notice = document.querySelector("#notice");

    if (notice) {
      setTimeout(() => {
        // Agrega la clase para iniciar la transición
        notice.classList.add("fade-out");

        // Espera a que termine la transición y luego elimina el elemento
        notice.addEventListener("transitionend", () => {
          notice.remove();
        });

        // Opcional: Establece un temporizador para asegurarte de que la eliminación se realice incluso si no se dispara el evento de transición
        setTimeout(() => {
          notice.remove();
        }, 1500); // Ajusta el tiempo según tus preferencias
      }, 1500); // Ajusta el tiempo según tus preferencias
    }
  }
}
