class ReviewMailer < ApplicationMailer

    def welcome_email
      @review = params[:review]
      @restaurant = params[:restaurant]
      @user = params[:current_user]
      mail(to: "#{@restaurant.user.email}", subject: 'Welcome to My Awesome Site', from: '@user.email')
    end
end
