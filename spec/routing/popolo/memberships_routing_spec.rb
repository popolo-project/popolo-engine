require 'spec_helper'

describe Popolo::MembershipsController do
  describe 'routing' do
    routes { Popolo::Engine.routes }

    it 'routes to #show' do
      get('/memberships/1').should route_to('popolo/memberships#show', id: '1')
    end
  end
end
