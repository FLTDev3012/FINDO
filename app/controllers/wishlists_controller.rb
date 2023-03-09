

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
    redirect_to wishlist_path(@wishlist)
  end

  def edit
    @wishlist = Wishlist.find(params[:id])
    authorize @wishlist
  end

  def destroy
    @wishlist = Wishlist.find(params[:id])
    authorize @wishlist
    @wishlist.destroy
  end

  def top
    @wishlist = Wishlist.find(params[:id])

    # on doit trouver le gift
    @gift_top = @wishlist.wishlists_gift.order("vote desc").limit(1).first
    # trouver celui qui a le plus de votes

    authorize @wishlist
  end

  private
  end
end

private

def wishlist_params
  params.require(:wishlist).permit(:name)
end
