Popolo::Engine.routes.draw do
  resources :places, only: [:index, :show], controller: 'divisions'
  resources :parties, only: [:index, :show]
  resources :people, only: [:index, :show]

  match 'places/*path/divisions' => 'divisions#nested_index'
  match 'places/*path' => 'divisions#nested_show'
end
