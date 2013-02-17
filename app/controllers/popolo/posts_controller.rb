module Popolo
  class PostsController < PopoloController
    inherit_resources
    respond_to :html, :json
    actions :index, :show
  end
end
