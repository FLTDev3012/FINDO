class WishlistsGiftsController < ApplicationController

  def show
    @wishlists_gift = WishlistsGift.find(params[:id])
    @wishlist = @wishlists_gift.wishlist
    @gift = @wishlists_gift.gift
    @gift_tags = @gift.tags
    @wishlist_tags = @wishlist.tags

    @tags = []
    @wishlist_tags.each do |tag|
    @tags << tag if @gift_tags.include?(tag)
    end
    # @tags1 = []
    # @tags2 = []
    # @tags.each_with_index do|tag, index|
    #   if index == 0 || index == 1
    #     @tags1 << tag
    #   else
    #     @tags2 << tag
    #   end
    # end
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
