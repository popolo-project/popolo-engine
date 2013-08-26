require 'spec_helper'

describe Popolo::OrganizationsController do
  describe 'routing' do
    before :each do
      @routes = Popolo::Engine.routes
    end

    it 'routes to #index' do
      get('/organizations').should route_to('popolo/organizations#index')
    end

    it 'routes to #show' do
      get('/organizations/1').should route_to('popolo/organizations#show', id: '1')
    end
  end
end
