import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share"
export default class extends Controller {
  static values = ['urlValue']

  connect() {
    console.log("Coucou from Alert")
  }

  share(event) {
    console.log(this.data.get("urlValue"))
    Swal.fire({
      icon: 'success',
      title: 'Le lien a bien été copié',
      text: this.data.get("urlValue"),
      showConfirmButton: false,
      timer: 40000
    })
  }
}
