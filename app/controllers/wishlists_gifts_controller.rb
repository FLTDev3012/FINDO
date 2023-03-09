class WishlistsGiftsController < ApplicationController

  def destroy
    @gift = Gift.find(params[:id])
    authorize @gift
    @gift.destroy
  end
end
