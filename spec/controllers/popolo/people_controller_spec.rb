require 'rails_helper'

module Popolo
  RSpec.describe PeopleController, type: :controller do
    routes { Engine.routes }

    before :each do
      @person = FactoryGirl.create(:person)
    end

    describe 'GET show' do
      it 'assigns the requested person as @person' do
        get :show, {id: @person.to_param}
        expect(assigns(:person)).to eq(@person)
      end
    end
  end
end
