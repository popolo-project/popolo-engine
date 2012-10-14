Popolo::Engine.routes.draw do
  resources :areas, only: [:index, :show]
  resources :organizations, only: [:index, :show]
  resources :people, only: [:index, :show]

  match 'areas/*path/areas' => 'areas#nested_index'
  match 'areas/*path' => 'areas#nested_show'
end
