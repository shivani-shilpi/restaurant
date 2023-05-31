class HardWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(current_user_id, review_id, restaurant_id)
    current_user = User.find_by(id: current_user_id)
    review = Review.find_by(id: review_id)
    restaurant = Restaurant.find_by(id: restaurant_id)

    ReviewMailer.with(current_user: current_user, review: review, restaurant: restaurant).welcome_email.deliver_now  
  end
end

