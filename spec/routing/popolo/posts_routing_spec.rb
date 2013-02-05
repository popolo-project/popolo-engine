require 'spec_helper'

describe Popolo::PostsController do
  describe 'routing' do
    before :each do
      @routes = Popolo::Engine.routes
    end

    it 'routes to #index' do
      get('/posts').should route_to('popolo/posts#index')
    end

    it 'routes to #show' do
      get('/posts/1').should route_to('popolo/posts#show', id: '1')
    end

    it 'routes to #show' do
      get('/posts/foo').should route_to('popolo/posts#show', id: 'foo')
    end
  end
end
