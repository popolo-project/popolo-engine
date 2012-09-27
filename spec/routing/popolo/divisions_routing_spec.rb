require 'spec_helper'

describe Popolo::DivisionsController do
  describe 'routing' do
    before :each do
      @routes = Popolo::Engine.routes
    end

    it 'routes to #index' do
      get('/divisions').should route_to('popolo/divisions#index')
    end

    it 'routes to #show' do
      get('/divisions/1').should route_to('popolo/divisions#show', id: '1')
    end

    it 'routes to #show' do
      get('/divisions/foo').should route_to('popolo/divisions#show', id: 'foo')
    end
  end
end
