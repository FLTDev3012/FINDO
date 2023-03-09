class GiftsController < ApplicationController
  def index
    @gifts = policy_scope(Gift)
  end

  def show
    @gift = Gift.find(params[:id])
    authorize @gift
  end

  def new
    @gift = Gift.new
    authorize @gift
  end

  def create
    @gift = Gift.new(gift_params)
    @gift.user = current_user
    authorize @gift
  end

  def edit
    @gift = Gift.find(params[:id])
    authorize @gift
  end

  def update
    @gift = Gift.find(params[:id])
    @gift.update(gift_params)
    authorize @gift
    @gift.save
  end

  def destroy
    @gift = Gift.find(params[:id])
    authorize @gift
    @gift.destroy
  end
end

private

def gift_params
  params.require(:gift).permit(:name, :price, :description)
end
