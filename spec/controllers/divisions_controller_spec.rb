require 'spec_helper'

describe Popolo::DivisionsController do
  # Alternatively, we can add "use_route: :popolo" to each "get" call.
  # @see https://github.com/radar/forem/blob/master/spec/support/controller_hacks.rb
  # @see https://github.com/radar/forem/blob/master/spec/support/routes.rb
  before(:each) do
    @routes = Popolo::Engine.routes
  end

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
