class RestaurantsController < ApplicationController
    def index
        @restaurants = Restaurant.all
    end

    def show
        @restaurant = Restaurant.find(params[:id])
    end

    def new
        @restaurant = Restaurant.new
    end

    def update
        if @restaurant.update(restaurant_params)
            redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
        else
            render :edit
        end
    end

    def edit
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)

        if @restaurant.save
            redirect_to restaurant_path(@restaurant), notice: 'Restaurant was successfully created.'
        else
            render :new
        end
    end

    private

    # def set_restaurant
    #     @restaurant = Restaurant.find(params[:id])
    # end

    def restaurant_params
        params.require(:restaurant).permit(:name, :address, :category, :phone_number)
    end
end
