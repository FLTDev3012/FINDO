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



    @top_presents = {}
    @my_wishlists.each do |wishlist|
      top_gift = wishlist.wishlists_gifts.top_votes_for_wishlist_gift(wishlist.id)
      @top_presents[wishlist] = top_gift if top_gift.present?
    end

    # votes , si un user a vote sur un wishlists_gift de notre wishlist
     #@users_who_voted = User.where(id: Vote.where(wishlists_gift_id: @my_wishlists.map(&:wishlists_gifts).flatten.map(&:id)).pluck(:user_id))
     #@users_who_votedtwo = User.joins(:votes).where(votes: {wishlists_gift_id: @my_wishlists.map(&:wishlists_gifts).flatten.map(&:id)}).uniq

     # @user_voter = User.joins(:votes).where(votes: { wishlists_gift_id: wishlist.wishlists_gifts.pluck(:id) }).uniq
    # @users_who_votedf = User.joins(:votes).where(votes: { wishlists_gift_id: wishlist.id }).distinct


    # @users_who_votedtwo = User.joins(:votes).where(votes: {wishlist_gift_id: @my_wishlists})

    # users_who_votedtr = wishlist.votes.map(&:user).uniq

    # ------------ EXPLICATION ------------------

    # ------------ 1 ------------------


    # 1 Tout d'abord, nous utilisons la méthode pluck pour extraire les ID des wishlists_gifts qui appartiennent aux wishlists de l'utilisateur connecté. Nous faisons cela en appelant map sur @my_wishlists pour extraire les wishlists_gifts associées à chaque wishlist, en utilisant la méthode flatten pour les regrouper dans un seul tableau, puis en appelant à nouveau map avec &:id pour extraire les ID des wishlists_gifts.

    # 1 RESULT
    #@my_wishlists.map(&:wishlists_gifts).flatten.map(&:id)

    # ------------ 2 ------------------


    # 2 Ensuite, nous utilisons where pour récupérer tous les votes qui sont associés à ces wishlists_gifts. Nous filtrons les votes en utilisant la condition wishlists_gift_id:, qui permet de ne récupérer que les votes pour les wishlists_gifts dont les ID ont été extraits à l'étape précédente.

    # 2 RESULT

    # Vote.where(wishlists_gift_id: @my_wishlists.map(&:wishlists_gifts).flatten.map(&:id))

    # ------------ 3 ------------------


    # 3 Enfin, nous utilisons pluck pour extraire les ID des utilisateurs qui ont voté pour ces wishlists_gifts, et where pour récupérer les utilisateurs correspondants. Nous faisons cela en utilisant pluck avec :user_id pour extraire les ID des utilisateurs, puis en utilisant where pour récupérer tous les utilisateurs dont les ID correspondent à ceux extraits à l'étape précédente.

    # 3 RESULT

    # User.where(id: Vote.where(wishlists_gift_id: @my_wishlists.map(&:wishlists_gifts).flatten.map(&:id)).pluck(:user_id))

    # ------------ PLUCK C EST QUOI ? ------------------

    # pluck est une méthode de Rails qui permet d'extraire une colonne ou une liste de colonnes d'une table de la base de données sous forme d'un tableau. La méthode retourne un tableau contenant les valeurs de la ou des colonnes spécifiées.

    # Par exemple, si nous avons un modèle User avec une colonne name, nous pouvons utiliser la méthode pluck pour extraire tous les noms d'utilisateurs sous forme de tableau comme ceci :


    # User.pluck(:name)
    # User.where("age > ?", 30).pluck(:name)
    # Cela renverra un tableau contenant les noms des utilisateurs dont l'âge est supérieur à 30 ans.


    @current_user_votes = Vote.where(user_id: current_user.id)
    # @current_user_wishlists = Wishlist.where(user_id: current_user.id)   EN FAITE CEST @my_wishlists ^^'



    # je recupere les whislists ou j ai vote meme si je ne les ai pas cree (et je fais attention de ne pas recuper une whislist que j ai cree car je lai deja recupere au dessus)

  end




  def dashboardwish
    #je recupere les wishlist aue j ai creee (meme si j ai pas vote)
    @my_wishlists = current_user.wishlists.to_a

    # je recupere les whislists ou j ai vote meme si je ne les ai pas cree (et je fais attention de ne pas recuper une whislist que j ai cree car je lai deja recupere au dessus)
    Vote.where(user: current_user).each do |vote|
      wishlist = Wishlist.find(vote.wishlists_gift.wishlist_id)

      @my_wishlists << wishlist unless @my_wishlists.include?(wishlist)
    end



    @top_presents = {}
    @my_wishlists.each do |wishlist|
      top_gift = wishlist.wishlists_gifts.top_votes_for_wishlist_gift(wishlist.id)
      @top_presents[wishlist] = top_gift if top_gift.present?
    end

    # votes , si un user a vote sur un wishlists_gift de notre wishlist
     #@users_who_voted = User.where(id: Vote.where(wishlists_gift_id: @my_wishlists.map(&:wishlists_gifts).flatten.map(&:id)).pluck(:user_id))
     #@users_who_votedtwo = User.joins(:votes).where(votes: {wishlists_gift_id: @my_wishlists.map(&:wishlists_gifts).flatten.map(&:id)}).uniq

     # @user_voter = User.joins(:votes).where(votes: { wishlists_gift_id: wishlist.wishlists_gifts.pluck(:id) }).uniq
    # @users_who_votedf = User.joins(:votes).where(votes: { wishlists_gift_id: wishlist.id }).distinct


    # @users_who_votedtwo = User.joins(:votes).where(votes: {wishlist_gift_id: @my_wishlists})

    # users_who_votedtr = wishlist.votes.map(&:user).uniq

    # ------------ EXPLICATION ------------------

    # ------------ 1 ------------------


    # 1 Tout d'abord, nous utilisons la méthode pluck pour extraire les ID des wishlists_gifts qui appartiennent aux wishlists de l'utilisateur connecté. Nous faisons cela en appelant map sur @my_wishlists pour extraire les wishlists_gifts associées à chaque wishlist, en utilisant la méthode flatten pour les regrouper dans un seul tableau, puis en appelant à nouveau map avec &:id pour extraire les ID des wishlists_gifts.

    # 1 RESULT
    #@my_wishlists.map(&:wishlists_gifts).flatten.map(&:id)

    # ------------ 2 ------------------


    # 2 Ensuite, nous utilisons where pour récupérer tous les votes qui sont associés à ces wishlists_gifts. Nous filtrons les votes en utilisant la condition wishlists_gift_id:, qui permet de ne récupérer que les votes pour les wishlists_gifts dont les ID ont été extraits à l'étape précédente.

    # 2 RESULT

    # Vote.where(wishlists_gift_id: @my_wishlists.map(&:wishlists_gifts).flatten.map(&:id))

    # ------------ 3 ------------------


    # 3 Enfin, nous utilisons pluck pour extraire les ID des utilisateurs qui ont voté pour ces wishlists_gifts, et where pour récupérer les utilisateurs correspondants. Nous faisons cela en utilisant pluck avec :user_id pour extraire les ID des utilisateurs, puis en utilisant where pour récupérer tous les utilisateurs dont les ID correspondent à ceux extraits à l'étape précédente.

    # 3 RESULT

    # User.where(id: Vote.where(wishlists_gift_id: @my_wishlists.map(&:wishlists_gifts).flatten.map(&:id)).pluck(:user_id))

    # ------------ PLUCK C EST QUOI ? ------------------

    # pluck est une méthode de Rails qui permet d'extraire une colonne ou une liste de colonnes d'une table de la base de données sous forme d'un tableau. La méthode retourne un tableau contenant les valeurs de la ou des colonnes spécifiées.

    # Par exemple, si nous avons un modèle User avec une colonne name, nous pouvons utiliser la méthode pluck pour extraire tous les noms d'utilisateurs sous forme de tableau comme ceci :


    # User.pluck(:name)
    # User.where("age > ?", 30).pluck(:name)
    # Cela renverra un tableau contenant les noms des utilisateurs dont l'âge est supérieur à 30 ans.


    @current_user_votes = Vote.where(user_id: current_user.id)
    # @current_user_wishlists = Wishlist.where(user_id: current_user.id)   EN FAITE CEST @my_wishlists ^^'



    # je recupere les whislists ou j ai vote meme si je ne les ai pas cree (et je fais attention de ne pas recuper une whislist que j ai cree car je lai deja recupere au dessus)

  end




end
