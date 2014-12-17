require 'rails_helper'

module Popolo
  RSpec.describe OrganizationsController, type: :controller do
    routes { Engine.routes }

    before :each do
      @organization = FactoryGirl.create(:organization)
    end

    describe 'GET index' do
      it 'assigns all organizations as @organizations' do
        get :index, {}
        expect(assigns(:organizations)).to eq([@organization])
      end
    end

    describe 'GET show' do
      it 'assigns the requested organization as @organization' do
        get :show, {id: @organization.to_param}
        expect(assigns(:organization)).to eq(@organization)
      end
    end
  end
end
