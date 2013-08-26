module Popolo
  class OrganizationsController < PopoloController
    inherit_resources
    respond_to :html, :json
    actions :index, :show

    def index
      @organizations = Organization.roots
      index!
    end
  end
end
