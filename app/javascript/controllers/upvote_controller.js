import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="upvote"
export default class extends Controller {
  connect() {}
  addvote(event) {
    const id = event.currentTarget.dataset.wishlistgift;
    const url = `${window.location.origin}/votes`;
    const nbVotes = document.getElementById(`vote-${id}`)
    const element = event.currentTarget
    element.classList.add("d-none")

  //   console.log(nbVotes);
  //   console.log(id);
    const token = document.getElementsByName("csrf-token")[0].content;
    fetch(url, {
      method: "POST",
      headers: { "Content-Type": "application/json", "X-CSRF-Token": token },
      body: JSON.stringify({ wishlists_gift_id: id }),
    })
      // .then((response) => response.json())
      // .then((data) => {
      //   console.log(data.nb);
      //   nbVotes.innerHTML = data.nb
      //   element.classList.add("d-none")
      // });
  }
}

