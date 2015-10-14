module API
  module V1
    class GemstonesController < ApplicationController
    respond_to :json

    def index
      respond_with Gemstone.all
    end

    def show
      respond_with Gemstone.find(params[:id])
    end

    def create
      respond_with Gemstone.create(params[:gemstone])
    end

    def update
      respond_with Gemstone.update(params[:id], params[:gemstone])
    end

    def destroy
      respond_with Gemstone.destroy(params[:id])
    end
  end
end
