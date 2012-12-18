require_dependency 'popolo/application_controller'

module Popolo
  class PostsController < ApplicationController
    inherit_resources
    respond_to :html
    actions :none

    # For extensions only.
  end
end
