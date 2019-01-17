Rails.application.routes.draw do

  resources :orders

  resources :vendors

  devise_for :vendors, :controllers => { :sessions => "vendors/sessions"}

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users do
    resources :orders
  end

  resources :users, only: [:show]

  resources :vendors do
    resources :items
  end

  resources :vendors do
    resources :orders, only: [:index, :show]
  end

  root to: "welcome#landing_page"

  get "/home", to: "users#show"

  get "/add_money", to: "users#add_money"
end
