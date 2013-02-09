# coding: utf-8
require 'spec_helper'

describe Popolo::AreasController do
  before :each do
    @routes = Popolo::Engine.routes
    @area       = FactoryGirl.create :area, name: 'Canada'
    @ontario    = @area.children.create name: 'Ontario'
    @quebec     = @area.children.create name: 'Québec'
    @montreal   = @quebec.children.create name: 'Montréal'
    @villemarie = @montreal.children.create name: 'Ville-Marie'
  end

  describe 'GET index' do
    it 'assigns all areas as @areas' do
      get :index
      assigns(:areas).to_a.should == [@area]
      response.should be_success
    end
  end

  describe 'GET show' do
    it 'assigns the requested area as @area' do
      get :show, id: @area.id.to_s
      assigns(:area).should == @area
      response.should be_success
    end

    it 'gets the requested area by slug' do
      get :show, id: @area.slug
      assigns(:area).should == @area
      response.should be_success
    end
  end

  describe 'GET nested_index' do
    it 'succeeds if properly nested' do
      get :nested_index, path: 'canada/quebec/montreal'
      assigns(:areas).to_a.should == [@villemarie]
      response.should be_success
    end

    it 'fails if improperly nested' do
      expect {get :nested_index, path: 'canada/ontario/montreal'}.to raise_error(Mongoid::Errors::DocumentNotFound)
    end
  end

  describe 'GET nested_show' do
    it 'succeeds if properly nested' do
      get :nested_show, path: 'canada/quebec/montreal'
      assigns(:area).should == @montreal
      response.should be_success
    end

    it 'fails if improperly nested' do
      expect {get :nested_show, path: 'canada/ontario/montreal'}.to raise_error(Mongoid::Errors::DocumentNotFound)
    end
  end
end
