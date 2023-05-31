class MenusController < ApplicationController
    before_action :authenticate_user!

    def index
        @restaurant = Restaurant.find(params[:restaurant_id])
        @menus = Menu.order(position: :desc)
    end

    def new
        @restaurant = Restaurant.find(params[:restaurant_id])
        @menu = @restaurant.menus.build
    end

    def show
        @restaurant = Restaurant.find(params[:restaurant_id])
        @menu = @restaurant.menus.find(params[:id])
    end 

    def edit
        @restaurant = Restaurant.find(params[:restaurant_id])
        @menu = @restaurant.menus.find(params[:id])
    end

    def create
        @restaurant = Restaurant.find(params[:restaurant_id])  
        @menu = @restaurant.menus.create(menu_params)
        @menu.save
          redirect_to restaurant_menus_path
        
    end

    def update
        if @menu.update_attributes(menu_params)
            redirect_to restaurant_menus_path
        else
        render action: 'edit'
        end
    end 

    def destroy
        @restaurant = Restaurant.find(params[:restaurant_id]) 
        @menu = Menu.find(params[:id])
        @menu.destroy 
          redirect_to restaurant_menus_path

    end

    private 

    def menu_params
        params.require(:menu).permit(:title, :position, :description, :pricing, pictures: [])
    end
    
end
