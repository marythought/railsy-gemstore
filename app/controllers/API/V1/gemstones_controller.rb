module API
  module V1
    class GemstonesController < ApplicationController

      respond_to :json

      def index
        @gemstones = Gemstone.all
        render json: {url: gemstones_path, gemstones: @gemstones }
      end

      def show
        respond_with Gemstone.find(params[:id])
      end

      def create
        gemstone = Gemstone.new(gemstone_params)
        if gemstone.save
          render json: {url: gemstone_path(gemstone), gemstone: gemstone }, status: :created
        else
          render json: gemstone.errors, status: :unprocessable_entity
        end
      end

      def update
        respond_with Gemstone.update(params[:id], gemstone_params)
      end

      def destroy
        respond_with Gemstone.destroy(params[:id])
      end

      private

      def gemstone_params
        params.require(:gemstone).permit(:name, :description, :shine, :price, :rarity, :color, :faces)
      end
    end
  end
end
