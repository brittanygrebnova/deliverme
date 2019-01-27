Rails.application.routes.draw do

  root to: "welcome#landing_page"

  get "/home", to: "users#show"

  get "/add_money", to: "users#add_money"

  patch "/add_money", to: "users#update_balance"

  get "users/add_profile", to: "users#add_profile", as: "add_user_profile"

  patch "users/add_profile", to: "users#update_profile", as: "update_user_profile"

  get "vendors/add_profile", to: "vendors#add_profile", as: "add_vendor_profile"

  patch "vendors/add_profile", to: "vendors#update_profile", as: "update_vendor_profile"

  devise_for :vendors, :controllers => { :sessions => "vendors/sessions" }

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :orders

  resources :vendors

  resources :users do
    resources :orders
  end

  resources :users

  resources :vendors do
    resources :items
  end

  # resources :vendors do
  #   resources :orders, only: [:index, :show]
  # end

end
