import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="share"
export default class extends Controller {
  static values = ["urlValue"];

  connect() {
    console.log("Coucou from Alert");
  }

  share(event) {
    console.log(this.data.get("urlValue"));
    this.unsecuredCopyToClipboard(this.data.get("urlValue"));

    Swal.fire({
      icon: "success",
      title: "Le lien a bien été copié",
      text: this.data.get("urlValue"),
      showConfirmButton: false,
      timer: 40000,
    });
  }

  unsecuredCopyToClipboard(text) {
    const textArea = document.createElement("textarea");
    textArea.value = text;

    document.body.appendChild(textArea);
    textArea.focus();
    textArea.select();
    try {
      document.execCommand("copy");
    } catch (err) {
      console.error("Unable to copy to clipboard", err);
    }
    document.body.removeChild(textArea);
  }
}
