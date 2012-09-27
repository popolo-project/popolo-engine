require_dependency 'popolo/application_controller'

module Popolo
  class PartiesController < ApplicationController
    inherit_resources
    respond_to :html, :json
    actions :index, :show

    def show
      @party = Party.find_by_slug(params[:id])
      show!
    end
  end
end
