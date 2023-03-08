

class WishlistsController < ApplicationController
  def index
    @wishlists = policy_scope(Wishlist)
  end

  def show
    @wishlist = Wishlist.find(params[:id])
    authorize @wishlist
  end

  def new
    @wishlist = Wishlist.new
    authorize @wishlist
  end

  def create
    @wishlist = Wishlist.new(wishlist_params)
    @wishlist.user = current_user
    authorize @wishlist
    @wishlist.save
  end

  def edit
    @wishlist = Wishlist.find(params[:id])
    authorize @wishlist
  end
end

private

def wishlist_params
  params.require(:wishlist).permit(:name)
end
