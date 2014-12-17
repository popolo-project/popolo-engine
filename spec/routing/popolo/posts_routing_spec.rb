require 'rails_helper'

module Popolo
  RSpec.describe PostsController, type: :routing do
    describe 'routing' do
      routes { Engine.routes }

      it 'routes to #show' do
        expect(get: '/posts/1').to route_to('popolo/posts#show', id: '1')
      end
    end
  end
end
