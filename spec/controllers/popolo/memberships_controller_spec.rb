require 'spec_helper'

describe Popolo::MembershipsController do
  before :each do
    @routes = Popolo::Engine.routes
    @membership = FactoryGirl.create :membership
  end

  describe 'GET index' do
    it 'assigns all memberships as @memberships' do
      get :index
      assigns(:memberships).to_a.should == [@membership]
      response.should be_success
    end
  end

  describe 'GET show' do
    it 'assigns the requested membership as @membership' do
      get :show, id: @membership.id.to_s
      assigns(:membership).should == @membership
      response.should be_success
    end
  end
end
