Rails.application.routes.draw do
  resources :timeslots
  resources :workshops
  resources :workshops do
    end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
