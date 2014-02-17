Popolo::Engine.routes.draw do
  resources :organizations, only: [:index, :show], id: /.*/
  resources :memberships, only: :show, id: /.*/
  resources :people, only: :show, id: /.*/
  resources :posts, only: :show, id: /.*/

  # A host application will sometimes complain about a missing `root_path`, even
  # if it defines a `root_path`. Setting a reasonable default here.
  root to: 'organizations#index'
end
