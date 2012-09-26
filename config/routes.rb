Popolo::Engine.routes.draw do
  resources :divisions, only: [:index, :show]
end
