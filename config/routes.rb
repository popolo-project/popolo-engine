Popolo::Engine.routes.draw do
  resources :organizations, only: [:index, :show]
  resources :people, only: [:index, :show]
  resources :posts, only: [:index, :show]

  match 'organizations/*path/organizations' => 'organizations#nested_index', as: 'nested_organizations'
  match 'organizations/*path/posts/:id' => 'organizations#post', as: 'nested_organization_post'
  match 'organizations/*path/posts' => 'organizations#posts', as: 'nested_organization_posts'
  match 'organizations/*path' => 'organizations#nested_show', as: 'nested_organization'

  # A host application will sometimes complain about a missing `root_path`, even
  # if it defines a `root_path`. Setting a reasonable default here.
  root to: 'organizations#index'
end
