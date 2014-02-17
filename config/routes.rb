Popolo::Engine.routes.draw do
  resources :organizations, only: [:index, :show], id: /.*/ do
    resources :posts, only: [:index, :show]
  end
  resources :people, only: [:index, :show], id: /.*/
  resources :posts, only: [:index, :show], id: /.*/

  # A host application will sometimes complain about a missing `root_path`, even
  # if it defines a `root_path`. Setting a reasonable default here.
  root to: 'organizations#index'
end
