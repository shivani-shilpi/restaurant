class ReviewsController < ApplicationController
    def create
      @restaurant = Restaurant.find(params[:restaurant_id])
      @review = @restaurant.reviews.new(review_params)
      @review.user_id = current_user.id
      @review.save
      HardWorker.perform_async(current_user.id, @review.id,  @restaurant.id)   
    end

    def destroy
      @restaurant = Restaurant.find(params[:restaurant_id])
      @review = @restaurant.reviews.find(params[:id])
      @review.destroy 
       
    end

    private
    def review_params
        params.require(:review).permit(:title, :description, :rating)
    end
end
