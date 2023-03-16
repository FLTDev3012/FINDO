

class WishlistsController < ApplicationController
  def index
    @wishlists = policy_scope(Wishlist)
  end

  def show
    @wishlist = Wishlist.find(params[:id])
    # filter les gifts en fonction des tags # récupérer la valeur du champ de saisie
    @tags = @wishlist.tags
    # @gifts = []
    # WishlistsGift.where(wishlist: @wishlist).each do |wishlistgift|
    #   @gifts << Gift.find(wishlistgift.gift_id)
    # end
    # @max_draw = Drawing.where("drawing_number ~* ?", '^A\d{4}$')



    # --------je trie les tags par ordre alphab ------------
    # --------je garde seulement le 1er ------------
    # --------car il commence par 0, 1, 2 ou 5 ------------
    # --------donc c'est le tag du prix ------------
    @tag_price = @tags.sort_by{|tag| tag.name}.first

    # --------on recupère le prix min et max du range ------------
    @min_price = @tag_price.name.match(/\A.*\./).to_s.split(".")[0].to_i
    @max_price = @tag_price.name.match(/\...\w*/).to_s.split(".").last.to_i

    # --------on garde seulement les cadeaux inclus dans ce range ------------
    @wish_gifts = @wishlist.wishlists_gifts.select do |w_gift|
      w_gift.gift.price > @min_price && w_gift.gift.price < @max_price
    end

    # --------on les trie en fonction du nb  de votes ------------
    @gifts = @wish_gifts.sort_by {|w_g| w_g.vote}.reverse



    # --------SOLUTION JORDANE SI BESOIN ------------
    # @gifts = @wishlist.wishlists_gifts.order(vote: :DESC)



    # @gifts = Gift.all.select { |gift| gift.tags.include?(@tags) }
    #@gifts = Gift.joins(:tags).where(tags: { id: @tags.pluck(:id) }).distinct
    # Gift.joins(:tags) : Cette partie de la ligne de code effectue une jointure entre les tables gifts et tags. En utilisant joins, nous demandons à ActiveRecord d'effectuer une jointure interne entre les tables en fonction de leur relation, ce qui signifie que seuls les cadeaux ayant au moins un tag seront inclus dans la requête.
    # Nous utilisons :tags pour spécifier la relation entre les modèles Gift et Tag. where(tags: { id: @tags.pluck(:id) }) : Cette partie de la ligne de code applique un filtre à la requête en utilisant les ID des tags de la variable @tags. Nous utilisons pluck(:id) pour extraire un tableau contenant les ID des tags, puis nous construisons une condition de filtre en utilisant ces ID. Nous spécifions la table tags et l'attribut id dans la condition en utilisant tags: { id: ... }
    # distinct : Cette partie de la ligne de code supprime les doublons de la requête. Si un cadeau a plusieurs tags correspondant aux ID filtrés, il apparaîtra une fois dans la collection @gifts
    # En résumé, la nouvelle ligne de code sélectionne tous les cadeaux qui ont au moins un tag correspondant aux tags de la variable @tags, en utilisant une jointure entre les tables gifts et tags. Elle applique également une condition de filtre pour ne sélectionner que les cadeaux qui ont des tags spécifiques. Enfin, elle supprime les doublons de la requête pour s'assurer que chaque cadeau n'apparaît qu'une fois dans la collection @gifts
    authorize @wishlist
  end

  def new
    @wishlist = Wishlist.new

    @first_tag = Tag.all.select { |tag| tag.name == "Anniversaire" || tag.name == "Noël" || tag.name == "Naissance" || tag.name == "Petit cadeau" }
    # first_tag = selectionne dans tout les tags, les tags ou le tag est == a ....
    @second_tag = Tag.all.select { |tag| tag.name == "Bébé" || tag.name == "Ado" || tag.name == "Adulte" || tag.name == "Enfant" }

    @third_tag = Tag.all.select { |tag| tag.name == "Décoration" || tag.name == "Sport" || tag.name == "Made in France" || tag.name == "Lifestyle" || tag.name == "Beauté" || tag.name == "Zéro déchet" || tag.name == "Artisanal" || tag.name == "DIY" || tag.name == "High-Tech"}

     @fourth_tag = Tag.all.select { |tag| tag.name == "0...500€" || tag.name == "0...25€" || tag.name == "25...50€" || tag.name == "50...100€" || tag.name == "100...200€" || tag.name == "200...500€" }

    authorize @wishlist
  end

  def create
    @wishlist = Wishlist.new
    @wishlist.user = current_user

    @wishlist.name = params[:wishlist_name]
    # assignation wishlist.name au params dans le formulaire de depars
    # <%= label_tag :wishlist_name, "Nom de la wishlist"%>
    #  <%= text_field_tag :wishlist_name %>
    # wishlist > new.html.erb
    @wishlist.save
    # recuperer ;es tags en true dans le formualire les trsnformer en wishlist tag et les dpnner a la wishlist
    @chosen_tag = params.select { |key, value| value == "true" }.keys
    @chosen_tag.each do |tag|
      WishlistsTag.create!(wishlist: @wishlist, tag: Tag.find_by_name(tag))
    end

    @tags = @wishlist.tags
    @gifts = Gift.joins(:tags).where(tags: { id: @tags.pluck(:id) }).distinct
    @gifts.each do |gift|
      WishlistsGift.create(wishlist: @wishlist, gift: gift, vote: 0)
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
