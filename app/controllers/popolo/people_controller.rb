module Popolo
  class PeopleController < PopoloController
    inherit_resources
    respond_to :html, :json
    actions :index, :show
  end
end
