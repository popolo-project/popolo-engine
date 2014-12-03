require 'spec_helper'

describe Popolo::OtherName do
  it {should validate_presence_of :name}

  [:start_date, :end_date].each do |attribute|
    it_should_behave_like 'a model with a date attribute', attribute
  end
end
