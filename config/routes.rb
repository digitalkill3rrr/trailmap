Rails.application.routes.draw do
  resources :spot_images
  resources :images
  get 'users/index'
  devise_for :users
  resources :collections
  resources :routes do
    get :map_data, on: :member
  end
  resources :comments
  resources :spots
  get 'pages/home'
  resources :pages

  get 'users/profile'
  get 'users/routes'
  get 'users/collections'
  get 'users/spots'

  get '/tagged', to: "spots#tagged", as: :tagged

  root 'pages#home'
end
