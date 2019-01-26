Rails.application.routes.draw do

  root to: "welcome#landing_page"

  get "/home", to: "users#show"

  get "/add_money", to: "users#add_money"

  patch "/add_money", to: "users#update_balance"

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

  resources :vendors do
    resources :orders, only: [:index, :show]
  end

end
