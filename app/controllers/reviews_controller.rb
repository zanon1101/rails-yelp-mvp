class ReviewsController < ApplicationController 
    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        # we need `restaurant_id` to associate review with corresponding restaurant
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review.restaurant = @restaurant
        @review.save
        redirect_to restaurant_path(@restaurant)
        end

        private

        def review_params
        params.require(:review).permit(:content)
        end

        def destroy
            @review = Review.find(params[:id])
            @review.destroy
            redirect_to restaurant_path(@review.restaurant)
        end
end
