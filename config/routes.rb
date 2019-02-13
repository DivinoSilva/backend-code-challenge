Rails.application.routes.draw do
  resources :coordinateds, only: [:create]
  resources :costs, only: [:index]
end
