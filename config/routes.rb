Rails.application.routes.draw do
  resources :workshops, shallow: true do
    resources :timeslots, shallow: true do
      resources :bookings
    end
  end
  devise_for :users
  root "workshops#index"
end
