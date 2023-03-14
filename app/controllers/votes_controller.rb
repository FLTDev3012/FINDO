class VotesController < ApplicationController
  def new
    @vote = Vote.new
    authorize @vote
  end

  def create

    # respond_to do |format|
    #   format.json
    # end
    @vote = Vote.new(vote_params)
    @vote.user = current_user
    @vote.save

    @wishlists_gift = WishlistsGift.find(params[:vote][:wishlists_gift_id])
    @wishlists_gift.vote += 1
    @wishlists_gift.save

    p @wishlists_gift

    @gift = @wishlists_gift.gift
    @gift.vote += 1
    @gift.save
    p @gift

    authorize @vote
    vote = {id: @vote.id}
    render json: vote
    # if @vote.save
    #   flash[:success] = 'Vote saved.'
    # end
  end

  def upvote
    raise
  end



  private

  def vote_params
    params.require(:vote).permit(:wishlists_gift_id)
  end
end
