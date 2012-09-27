require 'spec_helper'

describe Popolo::DivisionsController do
  before :each do
    @routes = Popolo::Engine.routes
    @division = FactoryGirl.create :division, name: 'Canada'
    @ontario  = @division.children.create name: 'Ontario'
    @quebec   = @division.children.create name: 'Quebec'
    @montreal = @quebec.children.create name: 'Montreal'
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

  describe 'GET blob' do
    it 'gets a properly nested division' do
      get :glob, path: 'canada/quebec/montreal'
      assigns(:divisions).should == [@division, @quebec, @montreal]
    end

    it 'fails to get an improperly nested division' do
      expect {get :glob, path: 'canada/ontario/montreal'}.to raise_error(Mongoid::Errors::DocumentNotFound)
    end
  end
end
