

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

    @fourth_tag = Tag.all.select { |tag| tag.name == "0-200+" || tag.name == "0-25" || tag.name == "25-50" || tag.name == "50-100" || tag.name == "100-200" || tag.name == "200+" }

    authorize @wishlist
  end

  def create
    @wishlist = Wishlist.new
    @wishlist.user = current_user
    @wishlist.save
    # recuperer les tags en true dans le formualire les trsnformer en wishlist tag et les dpnner a la wishlist
    @chosen_tag = params.select { |key, value| value == "true" }.keys
    @chosen_tag.each do |key|
      key = WishlistsTag.new(wishlist_id: @wishlist.id, tag_id: Tag.find_by_name(key).id)
    end
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
