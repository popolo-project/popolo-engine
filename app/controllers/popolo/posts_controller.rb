module Popolo
  class PostsController < PopoloController
    inherit_resources
    respond_to :html, :json
    actions :index, :show

    def show
      @post = Post.find_by_slug_or_id(params[:id])
      show!
    end
  end
end
