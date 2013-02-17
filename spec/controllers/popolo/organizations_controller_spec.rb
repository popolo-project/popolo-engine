# coding: utf-8
require 'spec_helper'

describe Popolo::OrganizationsController do
  before :each do
    @routes = Popolo::Engine.routes
    @organization  = FactoryGirl.create :organization, name: 'Acme Corporation'
    @abc           = @organization.children.create name: 'ABC, Inc.'
    @xyz           = @organization.children.create name: 'XYZ, Inc.'
    @department    = @xyz.children.create name: "Marketing Department"
    @branch        = @department.children.create name: "Youth Branch"
    @post          = FactoryGirl.create :post, organization: @xyz
  end

  describe 'GET index' do
    it 'assigns all organizations as @organizations' do
      get :index
      assigns(:organizations).to_a.should == [@organization]
      response.should be_success
    end
  end

  describe 'GET show' do
    it 'assigns the requested organization as @organization' do
      get :show, id: @organization.id.to_s
      assigns(:organization).should == @organization
      response.should be_success
    end
  end

  describe 'GET nested_index' do
    it 'succeeds if properly nested' do
      get :nested_index, path: 'acme-corporation/xyz-inc/marketing-department'
      assigns(:organizations).to_a.should == [@branch]
      response.should be_success
    end

    it 'fails if improperly nested' do
      expect {get :nested_index, path: 'acme-corporation/abc-inc/marketing-department'}.to raise_error(Mongoid::Errors::DocumentNotFound)
    end
  end

  describe 'GET nested_show' do
    it 'succeeds if properly nested' do
      get :nested_show, path: 'acme-corporation/xyz-inc/marketing-department'
      assigns(:organization).should == @department
      response.should be_success
    end

    it 'fails if improperly nested' do
      expect {get :nested_show, path: 'acme-corporation/abc-inc/marketing-department'}.to raise_error(Mongoid::Errors::DocumentNotFound)
    end
  end

  describe 'GET posts' do
    it 'assigns posts as @posts' do
      get :posts, path: 'acme-corporation/xyz-inc'
      assigns(:posts).to_a.should == [@post]
      response.should be_success
    end
  end
end
