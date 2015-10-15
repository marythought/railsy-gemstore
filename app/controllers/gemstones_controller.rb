class GemstonesController < ApplicationController

  def index
    @gemstones = Gemstone.all
  end

  def show
    @gemstone = Gemstone.find(params[:id])
  end

  private

  def gemstone_params
    params.require(:gemstone).permit(:name, :description, :shine, :price, :rarity, :color, :faces)
  end

end
