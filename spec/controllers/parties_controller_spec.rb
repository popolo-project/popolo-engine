require 'spec_helper'

describe Popolo::PartiesController do
  before :each do
    @routes = Popolo::Engine.routes
    @party = FactoryGirl.create :party
  end

  describe 'GET index' do
    it 'assigns all parties as @parties' do
      get :index
      assigns(:parties).to_a.should == [@party]
    end
  end

  describe 'GET show' do
    it 'assigns the requested party as @party' do
      get :show, id: @party.id.to_s
      assigns(:party).should == @party
    end

    it 'gets the requested party by slug' do
      get :show, id: @party.slug
      assigns(:party).should == @party
    end
  end
end
