require 'spec_helper'

describe Popolo::DivisionsController do
  before(:each) do
    @routes = Popolo::Engine.routes
  end

  # This should return the minimal set of attributes required to create a valid
  # District. As you add validations to District, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {name: 'Foo'}
  end

  describe 'GET index' do
    it 'assigns all divisions as @division' do
      division = Popolo::Division.create! valid_attributes
      get :index
      assigns(:divisions).to_a.should == [division]
    end
  end

  describe 'GET show' do
    it 'assigns the requested division as @division' do
      division = Popolo::Division.create! valid_attributes
      get :show, id: division.id.to_s
      assigns(:division).should == division
    end
  end
end
