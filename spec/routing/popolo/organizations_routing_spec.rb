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

    it 'routes to #nested_index' do
      get('/organizations/foo/organizations').should route_to('popolo/organizations#nested_index', path: 'foo')
    end

    it 'routes to #nested_show' do
      get('/organizations/foo/bar').should route_to('popolo/organizations#nested_show', path: 'foo/bar')
    end

    it 'routes to #posts' do
      get('/organizations/foo/posts').should route_to('popolo/organizations#posts', path: 'foo')
    end

    it 'routes to #post' do
      get('/organizations/foo/posts/bar').should route_to('popolo/organizations#post', path: 'foo', id: 'bar')
    end
  end
end
