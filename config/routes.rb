Rails.application.routes.draw do

  root to: "welcome#landing_page"

  get "/home", to: "users#show"

  get "/add_money", to: "users#add_money"

  patch "/add_money", to: "users#update_balance"

  get "users/:id/add_profile", to: "users#add_profile", as: "add_user_profile"

  patch "users/:id/add_profile", to: "users#update_profile", as: "update_user_profile"

  get "vendors/:id/add_profile", to: "vendors#add_profile", as: "add_vendor_profile"

  patch "vendors/:id/add_profile", to: "vendors#update_profile", as: "update_vendor_profile"

  devise_for :vendors, :controllers => { :sessions => "vendors/sessions", :registrations => "vendors/registrations" }

  devise_for :users, :controllers => { :sessions => "users/sessions", :registrations => "users/registrations", :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :orders

  resources :vendors

  resources :users

  resources :vendors do
    resources :orders, only: [:new, :show]
  end

  resources :vendors do
    resources :items
  end

  resources :orders do
    resources :items
  end

  # resources :vendors do
  #   resources :orders, only: [:index, :show]
  # end

end
