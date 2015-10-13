class GemstonesController < ApplicationController

  def index
    @gemstones = Gemstone.all
    respond_to do |format|
      format.html
      format.json { render json: @gemstones }
    end
  end

  def show
  end

end
