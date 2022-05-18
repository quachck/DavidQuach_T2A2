Rails.application.routes.draw do
  
  resources :workshops, shallow: true do
    resources :timeslots, shallow: true do
      resources :bookings
    end
  end
  # get '/workshops/:id/bookings/new', to: 'bookings#new', as: 'new_booking'
  # post '/workshops/:id/bookings', to: 'bookings#create'


  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
