class GemstonesController < ApplicationController

  def index
    @gemstones = Gemstone.all
    respond_to do |format|
      format.html
      format.json { render json: {url: gemstones_path, gemstones: @gemstones } }
    end
  end

  def show
    @gemstone = Gemstone.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: {url: gemstone_path, gemstone: @gemstone } }
    end
  end

  def create
    gemstone = Gemstone.new(gemstone_params)

    if gemstone.save
      render json: gemstone, status: :created
    else
      render json: gemstone.errors, status: :unprocessable_entity
    end
  end

  private

  def gemstone_params
    params.require(:gemstone).permit(:name, :description, :shine, :price, :rarity, :color, :faces)
  end

end
