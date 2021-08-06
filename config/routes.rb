Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  resources :airlines, only: [:index, :show]
  resources :flights, only: [:index]
  resources :bookings, only: [:create, :destroy]

end
