Onboard::Application.routes.draw do

  # Hook up URLs with rooms controller
  resources :rooms

  # Go to the homepage
  root 'rooms#index'

end
