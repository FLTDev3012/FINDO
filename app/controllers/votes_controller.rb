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
    @wishlists_gift = WishlistsGift.find(params[:vote][:wishlists_gift_id])


    if @vote.save
      @wishlists_gift.vote += 1
      @wishlists_gift.save
      @gift = @wishlists_gift.gift
      @gift.vote += 1
      @gift.save
    end

    authorize @vote
    vote = {nb: @wishlists_gift.vote}
    render json: vote
    # if @vote.save
    #   flash[:success] = 'Vote saved.'
    # end
  end



  private

  def vote_params
    params.require(:vote).permit(:wishlists_gift_id)
  end
end
