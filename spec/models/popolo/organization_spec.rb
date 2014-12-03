require 'spec_helper'

describe Popolo::Organization do
  [:founding_date, :dissolution_date].each do |attribute|
    it_should_behave_like 'a model with a date attribute', attribute
  end
end
