class RestaurantsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: [:show]

  def index
    @restaurants = current_user.restaurants.order(position: :desc)      
  end

  def edit
    @restaurant = current_user.restaurants.find(params[:id])
  end

  def new
    @restaurant = current_user.restaurants.build
    @restaurant.restaurant_images.build
  end

  def rest_sortable
    @restaurant = Restaurant.find(params[:id])
    @restaurant.each_with_index do |id, index|
      Restaurant.where(id: id).update_all(position: index + 1)
    end  
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    authorize! :read, @restaurant
  end

  def create
    @user = current_user
    @restaurant = @user.restaurants.create(restaurant_params)
    @restaurant.save
    @restaurants = current_user.restaurants
    params[:restaurant][:category_ids].each do |category|
      if category.present?
        @restaurant.restaurant_categories.create(category_id: category)
      end
    end
    flash.now[:notice] = "Restaurant was successfully created"
    respond_to do |format|
      format.js
    end  
  end

  def update
    @restaurant = current_user.restaurants.find(params[:id])
    @restaurant.update(restaurant_params)
    @restaurants = current_user.restaurants
    params[:restaurant][:category_ids].each do |category|
      if category.present?
        @restaurant.restaurant_categories.create(category_id: category)
      end
    end
      respond_to do |format|
        format.js
      end
  end

  def destroy
    @restaurant = current_user.restaurants.find(params[:id])
    @restaurant.destroy
  end

  def search
    @search = Restaurant.search do
      fulltext  params[:search]
    end
    @restaurants = @search.results
  end

  def google_map

  end 

  private
   
  def restaurant_params
    params.require(:restaurant).permit(:name, :position, :latitude, :longitude, :description, :image, :email, :contact, :full_address, clips: [], images: [] )
  end
end
