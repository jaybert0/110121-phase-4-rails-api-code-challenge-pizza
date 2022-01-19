class RestaurantPizzasController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_message

    def create
        restaurantPizza = RestaurantPizza.create!(pizza_id:params[:pizza_id], restaurant_id:params[:restaurant_id], price:params[:price])
        pizza = Pizza.find(params[:pizza_id])
        render json: pizza, status: :created
    end

    private

    def render_unprocessable_entity_message(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
