require 'rails_helper'

module Popolo
  RSpec.describe MembershipsController, type: :controller do
    routes { Engine.routes }

    before :each do
      @membership = FactoryGirl.create(:membership)
    end

    describe 'GET show' do
      it 'assigns the requested membership as @membership' do
        get :show, {id: @membership.to_param}
        expect(assigns(:membership)).to eq(@membership)
      end
    end
  end
end
