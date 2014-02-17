module Popolo
  class PostsController < PopoloController
    inherit_resources
    respond_to :html, :json
    actions :show
  end
end
