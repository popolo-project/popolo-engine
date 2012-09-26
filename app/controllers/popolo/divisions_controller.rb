require_dependency 'popolo/application_controller'

module Popolo
  class DivisionsController < ApplicationController
    inherit_resources
    respond_to :html, :json
    actions :index, :show
  end
end