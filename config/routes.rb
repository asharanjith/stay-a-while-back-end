Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :reservations, only: [:index, :create, :destroy]
  resources :home_stays, only: [:index, :show, :create, :destroy]
  resources :users, only: [:create]
  post "/login", to: "users#login"
  root to: redirect('/api-docs')
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
