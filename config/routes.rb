Popolo::Engine.routes.draw do
  resources :divisions, only: [:index, :show]
  resources :parties, only: [:index, :show]
  resources :people, only: [:index, :show]
end
