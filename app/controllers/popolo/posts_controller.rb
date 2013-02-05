require_dependency 'popolo/application_controller'

module Popolo
  class PostsController < ApplicationController
    inherit_resources
    respond_to :html, :json
    actions :index, :show

    def show
      @post = Post.find_by_slug(params[:id])
      show!
    end
  end
end
