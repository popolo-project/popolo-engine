require 'spec_helper'

describe Popolo::OrganizationsController do
  before :each do
    @routes = Popolo::Engine.routes
    @organization = FactoryGirl.create :organization
  end

  describe 'GET index' do
    it 'assigns all organizations as @organizations' do
      get :index
      assigns(:organizations).to_a.should == [@organization]
    end
  end

  describe 'GET show' do
    it 'assigns the requested organization as @organization' do
      get :show, id: @organization.id.to_s
      assigns(:organization).should == @organization
    end

    it 'gets the requested organization by slug' do
      get :show, id: @organization.slug
      assigns(:organization).should == @organization
    end
  end
end
