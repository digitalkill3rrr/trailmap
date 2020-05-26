Rails.application.routes.draw do
  resources :spot_images
  resources :images
  devise_for :users
  resources :users, only: [:index] do
    collection do
      get :profile
      get :routes
      get :collections
      get :spots
    end
  end

  resources :collections
  resources :routes do
    get :map_data, on: :member
  end
  resources :comments
  resources :spots

  resources :reports, only: [:create, :index] do
    member do
      post :approve
      post :reject
    end
  end

  get 'pages/home'
  get 'pages/constructor'

  get '/tagged', to: "spots#tagged", as: :tagged

  root 'pages#home'
end
