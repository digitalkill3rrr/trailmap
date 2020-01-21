Rails.application.routes.draw do
  resources :spots
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/tagged', to: "spots#tagged", as: :tagged
end
