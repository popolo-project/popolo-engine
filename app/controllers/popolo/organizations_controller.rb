require_dependency 'popolo/application_controller'

module Popolo
  class OrganizationsController < ApplicationController
    inherit_resources
    respond_to :html, :json
    actions :index, :show

    def show
      @organization = Organization.find_by_slug(params[:id])
      show!
    end
  end
end
