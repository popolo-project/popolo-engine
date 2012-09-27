require 'spec_helper'

describe Popolo::DivisionsController do
  describe 'routing' do
    before :each do
      @routes = Popolo::Engine.routes
    end

    it 'routes to #index' do
      get('/places').should route_to('popolo/divisions#index')
    end

    it 'routes to #show' do
      get('/places/1').should route_to('popolo/divisions#show', id: '1')
    end

    it 'routes to #show' do
      get('/places/foo').should route_to('popolo/divisions#show', id: 'foo')
    end

    it 'routes to #glob' do
      get('/places/foo/bar/baz').should route_to('popolo/divisions#glob', path: 'foo/bar/baz')
    end
  end
end
