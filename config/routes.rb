Rails.application.routes.draw do
  resources :images
  resources :reservations
  resources :home_stays
  resources :users, only: [:create]
  post "/login", to: "users#login"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
