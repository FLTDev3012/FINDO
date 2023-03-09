class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    #je recupere les wishlist aue j ai creee (meme si j ai pas vote)
    @my_wishlists = current_user.wishlists.to_a

    # je recupere les whislists ou j ai vote meme si je ne les ai pas cree (et je fais attention de ne pas recuper une whislist que j ai cree car je lai deja recupere au dessus)
    Vote.where(user: current_user).each do |vote|
      wishlist = Wishlist.find(vote.wishlists_gift.wishlist_id)

      @my_wishlists << wishlist unless @my_wishlists.include?(wishlist)
    end



    @top_presents = []
    @my_wishlists.each do |wishlist|
      @top_presents << WishlistsGift.top_votes_for_wishlist_gift(wishlist.id)
    end


    raise
  end
end
