require 'spec_helper'

describe Popolo::PeopleController do
  before :each do
    @routes = Popolo::Engine.routes
    @person = FactoryGirl.create :person
  end

  describe 'GET show' do
    it 'assigns the requested person as @person' do
      get :show, id: @person.id.to_s
      assigns(:person).should == @person
      response.should be_success
    end
  end
end
