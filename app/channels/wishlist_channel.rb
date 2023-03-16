class WishlistChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    wishlist = Wishlist.find(params[:id])
    stream_for wishlist
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
