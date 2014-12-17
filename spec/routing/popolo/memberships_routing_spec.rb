require 'rails_helper'

module Popolo
  RSpec.describe MembershipsController, type: :routing do
    describe 'routing' do
      routes { Engine.routes }

      it 'routes to #show' do
        expect(get: '/memberships/1').to route_to('popolo/memberships#show', id: '1')
      end
    end
  end
end
