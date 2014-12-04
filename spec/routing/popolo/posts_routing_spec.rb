require 'spec_helper'

describe Popolo::PostsController do
  describe 'routing' do
    routes { Popolo::Engine.routes }

    it 'routes to #show' do
      get('/posts/1').should route_to('popolo/posts#show', id: '1')
    end
  end
end
