

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

    @first_tag = Tag.all.select { |tag| tag.name == "Anniversaire" || tag.name == "Noël" || tag.name == "Naissance" || tag.name == "Petit cadeau" }

    @second_tag = Tag.all.select { |tag| tag.name == "Bébé" || tag.name == "Ado" || tag.name == "Adulte" || tag.name == "Enfant" }

    @third_tag = Tag.all.select { |tag| tag.name == "Décoration" || tag.name == "Sport" || tag.name == "Made in France" || tag.name == "Lifestyle" || tag.name == "Beauté" || tag.name == "Zéro déchet" || tag.name == "Artisanal" || tag.name == "DIY" || tag.name == "High-Tech"}

    authorize @wishlist
  end

  def create
    raise
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

end

private

def wishlist_params
  params.require(:wishlist).permit(:name)
end
