require_dependency 'popolo/application_controller'

module Popolo
  class PeopleController < ApplicationController
    inherit_resources
    respond_to :html, :json
    actions :index, :show

    def show
      @person = Person.find_by_slug(params[:id])
      # @todo @activities = @person.activities.sort(:published_at.desc).limit(50)
      show!
    end
  end
end
