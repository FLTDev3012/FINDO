import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { wishlistId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "WishlistChannel", id: this.wishlistIdValue },
      { received: data => this.upvote(data) }
    )
    console.log(`Subscribed to the wishlist with the id ${this.wishlistIdValue}.`)
  }

  upvote(data) {
    console.log(data)
    const element = document.querySelector(`#vote-${data.id}`)
    element.innerText = data.votes
    this.addAvatar(data)
  }

  addAvatar(data) {
    const element = document.getElementById(`user-${data.user_id}`)
    const avatars = document.querySelector(".vote-avatar")
    console.log(data.avatar)
    if(element) {
      element.outerHTML = data.avatar
    }
    else {
      avatars.insertAdjacentHTML("beforeend", data.avatar)

    }
  }
}
