require 'spec_helper'

describe Popolo::MembershipsController do
  before :each do
    @routes = Popolo::Engine.routes
    @membership = FactoryGirl.create :membership
  end

  describe 'GET show' do
    it 'assigns the requested membership as @membership' do
      get :show, id: @membership.id.to_s
      assigns(:membership).should == @membership
      response.should be_success
    end
  end
end
