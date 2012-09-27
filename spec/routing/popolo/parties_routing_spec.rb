require 'spec_helper'

describe Popolo::PartiesController do
  describe 'routing' do
    before :each do
      @routes = Popolo::Engine.routes
    end

    it 'routes to #index' do
      get('/parties').should route_to('popolo/parties#index')
    end

    it 'routes to #show' do
      get('/parties/1').should route_to('popolo/parties#show', id: '1')
    end

    it 'routes to #show' do
      get('/parties/foo').should route_to('popolo/parties#show', id: 'foo')
    end
  end
end
