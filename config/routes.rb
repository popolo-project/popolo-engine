Popolo::Engine.routes.draw do
  resources :areas, only: [:index, :show]
  resources :organizations, only: [:index, :show]
  resources :people, only: [:index, :show]
  resources :posts, only: [:index, :show]

  match 'areas/*path/areas' => 'areas#nested_index', as: 'nested_areas'
  match 'areas/*path' => 'areas#nested_show', as: 'nested_area'
  match 'organizations/*path/organizations' => 'organizations#nested_index', as: 'nested_organizations'
  match 'organizations/*path' => 'organizations#nested_show', as: 'nested_organization'
end
