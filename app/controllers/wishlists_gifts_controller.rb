class WishlistsGiftsController < ApplicationController

  def show
    @wishlists_gift = WishlistsGift.find(params[:id])
    @wishlist = @wishlists_gift.wishlist
    @gift = @wishlists_gift.gift
    authorize @wishlists_gift
  end

  def destroy
    @gift = Gift.find(params[:id])
    authorize @gift
    @gift.destroy
  end

  def top
    @wishlist = Wishlist.find(params[:id])

    # on doit trouver le gift
    @gift_top = @wishlists_gift.gift.order("vote desc").limit(1).first
    # trouver celui qui a le plus de votes

    authorize @wishlist
  end
end
