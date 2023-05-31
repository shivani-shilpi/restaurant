Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # require 'sidekiq/web'
  # mount Sidekiq::Web => "/sidkiq"
  
  root to: "home#index"


  resources :restaurants do
    resources :reviews, only: [:create, :destroy, :new]
    resources :menus
      collection do
        get :search , :google_map
      end
      member do
        post :rest_sortable
      end
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :subscriptions
  post "/card" => "subscriptions#create_card", as: :create_payment_method
  post 'subscribe' => 'subscriptions#subscribe', as: :subscribe
  
  get '/card/new' => 'subscriptions#new_card', as: :add_payment_method

  get 'success' => 'subscriptions#success', as: :success

end
