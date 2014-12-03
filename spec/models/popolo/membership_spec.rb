require 'spec_helper'

describe Popolo::Membership do
  [:organization_id, :person_id].each do |attribute|
    it {should validate_presence_of attribute}
  end

  [:start_date, :end_date].each do |attribute|
    it_should_behave_like 'a model with a date attribute', attribute
  end
end
