module Popolo
  class PeopleController < PopoloController
    inherit_resources
    respond_to :html, :json
    actions :index, :show

    def show
      @person = Person.find_by_slug_or_id(params[:id])
      show!
    end
  end
end
