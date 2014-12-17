require 'rails_helper'

module Popolo
  RSpec.describe PeopleController, type: :routing do
    describe 'routing' do
      routes { Engine.routes }

      it 'routes to #show' do
        expect(get: '/people/1').to route_to('popolo/people#show', id: '1')
      end
    end
  end
end
