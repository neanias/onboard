Onboard::Application.routes.draw do

  # Hook up URLs with rooms controller
  # Orders are inside room because we want to place an order on a room
  resources :rooms do
    resources :orders, only: [:new, :create]
  end

  # My list of orders don't have to be on a room
  resources :orders, only: [:index, :show]

  # Sign up our users to the site
  resources :users

  # Log in and out of our site
  # It's a singular resource because we can only do one session
  resource :session

  # Go to the homepage
  root 'rooms#index'

end
