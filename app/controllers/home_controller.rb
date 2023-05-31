class HomeController < ApplicationController
  def index
    @restaurants = Restaurant.all  

    if current_user.has_role? :owner 
      if current_user.stripe_id.nil? 
        redirect_to subscriptions_path
      else
        redirect_to restaurants_path
      end    
    end 
  end
end
