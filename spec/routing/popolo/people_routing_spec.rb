require 'spec_helper'

describe Popolo::PeopleController do
  describe 'routing' do
    before :each do
      @routes = Popolo::Engine.routes
    end

    it 'routes to #index' do
      get('/people').should route_to('popolo/people#index')
    end

    it 'routes to #show' do
      get('/people/1').should route_to('popolo/people#show', id: '1')
    end
  end
end
