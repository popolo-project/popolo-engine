require 'spec_helper'

describe Popolo::DivisionsController do
  before :each do
    @routes = Popolo::Engine.routes
    @division = FactoryGirl.create :division
  end

  describe 'GET index' do
    it 'assigns all divisions as @divisions' do
      get :index
      assigns(:divisions).to_a.should == [@division]
    end
  end

  describe 'GET show' do
    it 'assigns the requested division as @division' do
      get :show, id: @division.id.to_s
      assigns(:division).should == @division
    end

    it 'gets the requested division by slug' do
      get :show, id: @division.slug
      assigns(:division).should == @division
    end
  end
end
