class VotesController < ApplicationController
  def new
    @vote = Vote.new
    authorize @vote
  end

  def create
    @vote = Vote.new(vote_params)
    @vote.user = current_user
    authorize @vote
    if @vote.save
      flash[:success] = 'Vote saved.'
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:wishlist_gifter_id, :wishlist_id, :user_id)
  end
end
