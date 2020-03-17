Rails.application.routes.draw do
  resources :spot_images
  resources :images
  get 'users/index'
  devise_for :users
  resources :collections
  resources :routes
  resources :comments
  resources :spots
  get 'pages/home'
  resources :pages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/tagged', to: "spots#tagged", as: :tagged

  # root 'spots#index'
  # root 'routes#index'
  root 'pages#home'
end
