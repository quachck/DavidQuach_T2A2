Rails.application.routes.draw do
  resources :bookings
  resources :workshops do
    resources :timeslots
  end
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
