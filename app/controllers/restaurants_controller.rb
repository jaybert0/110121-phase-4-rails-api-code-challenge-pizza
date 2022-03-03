class RestaurantsController < ApplicationController
    def index
        render json: Restaurant.all, status: :ok
    end

    def show
        restaurant = Restaurant.find(params[:id])
        render json: restaurant, serializer: RpSerializer, status: :ok
    end

    def destroy
        restaurant = Restaurant.find(params[:id])
        restaurant.destroy
        head :no_content
    end
end
