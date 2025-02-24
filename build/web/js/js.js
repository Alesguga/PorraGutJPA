document.addEventListener('DOMContentLoaded', () => {
  console.log('ready')
  init()
});

function init() {
  onshowapostar()
  onshowresumen()
}

function onshowapostar() {
  const modalApuesta = document.getElementById('modalapuesta')
  if (modalApuesta) {
    modalApuesta.addEventListener('show.bs.modal', (event) => {
      const button = event.relatedTarget
      const partido = button.getAttribute('data-bs-partido')
      const local = button.getAttribute('data-bs-local')
      const visitante = button.getAttribute('data-bs-visitante')

      modalApuesta.querySelector('h5').textContent = local + ' - ' + visitante
      modalApuesta.querySelector('form').setAttribute('action', 'Controller?op=apuesta&partido=' + partido)
    })
  }
}

function onshowresumen() {
  const modalResumen = document.getElementById('modalresumen')
  if (modalResumen) {
    modalResumen.addEventListener('show.bs.modal', (event) => {
      const button = event.relatedTarget
      const partido = button.getAttribute('data-bs-partido')
      const local = button.getAttribute('data-bs-local')
      const visitante = button.getAttribute('data-bs-visitante')
      
      modalResumen.querySelector('h5').textContent = local + ' - ' + visitante

      // AJAX
      const xhr = new XMLHttpRequest();
      const url = "Controller?op=resumen&partido=" + partido
      xhr.open("GET", url, true);
      xhr.onload = () => {
        if (xhr.status == 200) {
          const resumen = modalResumen.querySelector(' .modal-body')
          resumen.innerHTML = xhr.responseText;
        }
      };
      xhr.send();
    })
  }
}
