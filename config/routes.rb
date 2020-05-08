Rails.application.routes.draw do
  resources :spot_images
  resources :images
  get 'users/index'
  devise_for :users
  as :user do
    get 'signin' => 'devise/sessions#new'
    post 'signin' => 'devise/sessions#create'
    delete 'signout' => 'devise/sessions#destroy'
  end

  get 'users/profile'
  get 'users/routes'
  get 'users/collections'
  get 'users/spots'

  resources :collections
  resources :routes do
    get :map_data, on: :member
  end
  resources :comments
  resources :spots

  resources :pages
  get 'pages/home'
  get 'pages/constructor'

  get '/tagged', to: "spots#tagged", as: :tagged

  root 'pages#home'
end
