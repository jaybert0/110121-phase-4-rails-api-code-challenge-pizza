class RestaurantsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_message


    def index
        render json: Restaurant.all, status: :ok
    end

    def show
        restaurant = find_restaurant
        render json: restaurant, status: :ok, serializer: RestaurantWithPizzaSerializer
    end

    def destroy
        restaurant = find_restaurant
        restaurant.destroy
    end

    private

        def find_restaurant
            Restaurant.find(params[:id])
        end

        def render_not_found_message
            render json: { error: "Restaurant not found" }, status: :not_found
        end

end
