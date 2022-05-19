Rails.application.routes.draw do
  resources :workshops, shallow: true do
    resources :timeslots, shallow: true do
      resources :bookings
    end
  end
  devise_for :users

  get "instructor", to: "workshops#instructor"
  get "sales", to: "bookings#sales"
  get "purchases", to: "bookings#purchases"

  root "workshops#index"
end
