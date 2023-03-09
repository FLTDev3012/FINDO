class VotesController < ApplicationController
  def new
    @vote = Vote.new
    authorize @vote
  end


end
