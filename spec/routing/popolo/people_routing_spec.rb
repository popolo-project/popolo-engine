require 'spec_helper'

describe Popolo::PeopleController do
  describe 'routing' do
    routes { Popolo::Engine.routes }

    it 'routes to #show' do
      get('/people/1').should route_to('popolo/people#show', id: '1')
    end
  end
end
