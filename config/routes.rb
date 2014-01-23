Onboard::Application.routes.draw do
  # Hook up URLs with rooms controller
  resources :rooms

  # Sign up our users to the site
  resources :users

  # Log in and out of our site
  # It's a singular resource because we can only do one session
  resource :session

  # Go to the homepage
  root 'rooms#index'

end
