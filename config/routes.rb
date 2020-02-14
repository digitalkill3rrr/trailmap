Rails.application.routes.draw do
  resources :kinds
  resources :seasons
  resources :difficulties
  resources :routes
  resources :spots
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/tagged', to: "spots#tagged", as: :tagged

  # root 'spots#index'
  root 'routes#index'
end