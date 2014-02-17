module Popolo
  class MembershipsController < PopoloController
    inherit_resources
    respond_to :html, :json
    actions :show
  end
end
