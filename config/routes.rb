Popolo::Engine.routes.draw do
  resources :areas, only: [:index, :show]
  resources :organizations, only: [:index, :show]
  resources :people, only: [:index, :show]
  resources :posts, only: [:index, :show]

  match 'areas/*path/areas' => 'areas#nested_index', as: 'nested_areas'
  match 'areas/*path/posts' => 'areas#posts'
  match 'areas/*path' => 'areas#nested_show', as: 'nested_area'
  match 'organizations/*path/organizations' => 'organizations#nested_index', as: 'nested_organizations'
  match 'organizations/*path/posts' => 'organizations#posts'
  match 'organizations/*path' => 'organizations#nested_show', as: 'nested_organization'

  # A host application will sometimes complain about a missing `root_path`, even
  # if it defines a `root_path`. Setting a reasonable default here.
  root to: 'organizations#index'
end
