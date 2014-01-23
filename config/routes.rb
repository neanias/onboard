Onboard::Application.routes.draw do
  # Hook up URLs with rooms controller
  resources :rooms

  # Sign up our users to the site
  resources :users

  # Go to the homepage
  root 'rooms#index'

end
