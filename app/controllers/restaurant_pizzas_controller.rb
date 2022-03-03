class RestaurantPizzasController < ApplicationController

    def create
        rp = RestaurantPizza.create!(rp_params)
        render json: rp.pizza, status: :created
    end

    private
    def rp_params
        params.permit(:price, :pizza_id, :restaurant_id)
    end
end
