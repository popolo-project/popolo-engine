require 'spec_helper'

describe Popolo::AreasController do
  before :each do
    @routes = Popolo::Engine.routes
    @area       = FactoryGirl.create :area, name: 'Canada'
    @ontario    = @area.children.create name: 'Ontario'
    @quebec     = @area.children.create name: 'Quebec'
    @montreal   = @quebec.children.create name: 'Montreal'
    @villemarie = @montreal.children.create name: 'Ville-Marie'
  end

  describe 'GET index' do
    it 'assigns all areas as @areas' do
      get :index
      assigns(:areas).to_a.should == [@area]
    end
  end

  describe 'GET show' do
    it 'assigns the requested area as @area' do
      get :show, id: @area.id.to_s
      assigns(:area).should == @area
    end

    it 'gets the requested area by slug' do
      get :show, id: @area.slug
      assigns(:area).should == @area
    end
  end

  describe 'GET nested_index' do
    it 'succeeds if properly nested' do
      get :nested_index, path: 'canada/quebec/montreal'
      assigns(:areas).to_a.should == [@villemarie]
    end

    it 'fails if improperly nested' do
      expect {get :nested_index, path: 'canada/ontario/montreal'}.to raise_error(Popolo::ImproperlyNestedResource)
    end
  end

  describe 'GET nested_show' do
    it 'succeeds if properly nested' do
      get :nested_show, path: 'canada/quebec/montreal'
      assigns(:area).should == @montreal
    end

    it 'fails if improperly nested' do
      expect {get :nested_show, path: 'canada/ontario/montreal'}.to raise_error(Popolo::ImproperlyNestedResource)
    end
  end
end
