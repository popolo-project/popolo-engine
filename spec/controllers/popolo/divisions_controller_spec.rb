require 'spec_helper'

describe Popolo::DivisionsController do
  before :each do
    @routes = Popolo::Engine.routes
    @division   = FactoryGirl.create :division, name: 'Canada'
    @ontario    = @division.children.create name: 'Ontario'
    @quebec     = @division.children.create name: 'Quebec'
    @montreal   = @quebec.children.create name: 'Montreal'
    @villemarie = @montreal.children.create name: 'Ville-Marie'
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

  describe 'GET nested_index' do
    it 'succeeds if properly nested' do
      get :nested_index, path: 'canada/quebec/montreal'
      assigns(:divisions).to_a.should == [@villemarie]
    end

    it 'fails if improperly nested' do
      expect {get :nested_index, path: 'canada/ontario/montreal'}.to raise_error(Popolo::ImproperlyNestedResource)
    end
  end

  describe 'GET nested_show' do
    it 'succeeds if properly nested' do
      get :nested_show, path: 'canada/quebec/montreal'
      assigns(:division).should == @montreal
    end

    it 'fails if improperly nested' do
      expect {get :nested_show, path: 'canada/ontario/montreal'}.to raise_error(Popolo::ImproperlyNestedResource)
    end
  end
end
