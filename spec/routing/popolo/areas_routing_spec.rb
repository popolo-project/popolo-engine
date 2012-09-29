require 'spec_helper'

describe Popolo::AreasController do
  describe 'routing' do
    before :each do
      @routes = Popolo::Engine.routes
    end

    it 'routes to #index' do
      get('/areas').should route_to('popolo/areas#index')
    end

    it 'routes to #show' do
      get('/areas/1').should route_to('popolo/areas#show', id: '1')
    end

    it 'routes to #show' do
      get('/areas/foo').should route_to('popolo/areas#show', id: 'foo')
    end

    it 'routes to #nested_index' do
      get('/areas/foo/areas').should route_to('popolo/areas#nested_index', path: 'foo')
    end

    it 'routes to #nested_show' do
      get('/areas/foo/bar').should route_to('popolo/areas#nested_show', path: 'foo/bar')
    end
  end
end
