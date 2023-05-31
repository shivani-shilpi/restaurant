class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  require "stripe"

    def index
      @user=current_user.email
    end
    
    def success
      @plans = Stripe::Plan.list.data
    end
    
    def new_card
      respond_to do |format|
        format.js
      end
    end

    def create_card 
      respond_to do |format|
        if current_user.stripe_id.nil?
          customer = Stripe::Customer.create({"email": current_user.email}) 
          current_user.update(:stripe_id => customer.id)
        end
  
        card_token = params[:stripeToken]
        if card_token.nil?
          format.html { redirect_to billing_path, error: "Oops"}
        end
  
        customer = Stripe::Customer.new current_user.stripe_id
        customer.source = card_token
        customer.save
  
        format.html { redirect_to success_path }
      end
    end

    def subscribe
      if current_user.stripe_id.nil?
        redirect_to success_path, :flash => {:error => 'Firstly you need to enter your card'}
        return
      end

      customer = Stripe::Customer.new current_user.stripe_id

      subscriptions = Stripe::Subscription.list(customer: customer.id)
      subscriptions.each do |subscription|
        subscription.delete
      end

      plan_id = params[:plan_id]
      subscription = Stripe::Subscription.create({
                                                     customer: customer,
                                                     items: [{plan: plan_id}], })

      subscription.save
      redirect_to restaurants_path
    end

    def create_card 
      respond_to do |format|
        if current_user.stripe_id.nil?
          customer = Stripe::Customer.create({"email": current_user.email}) 
          current_user.update(:stripe_id => customer.id)
        end
  
        card_token = params[:stripeToken]
        if card_token.nil?
          format.html { redirect_to subscriptions_path, error: "Oops"}
        end
  
        customer = Stripe::Customer.new current_user.stripe_id
        customer.source = card_token
        customer.save
  
        format.html { redirect_to success_path }
      end
    end
end
