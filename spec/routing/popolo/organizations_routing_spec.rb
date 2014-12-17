require 'rails_helper'

module Popolo
  RSpec.describe OrganizationsController, type: :routing do
    describe 'routing' do
      routes { Engine.routes }

      it 'routes to #index' do
        expect(get: '/organizations').to route_to('popolo/organizations#index')
      end

      it 'routes to #show' do
        expect(get: '/organizations/1').to route_to('popolo/organizations#show', id: '1')
      end
    end
  end
end
