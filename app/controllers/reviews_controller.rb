class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    respond_to do |format|
      format.html
      format.json { render json: @reviews }
    end
  end

  def show
    @review = Review.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: {url: reviews, review: @review } }
    end
  end

  def create

  end

end
