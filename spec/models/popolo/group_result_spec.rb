require 'spec_helper'

describe Popolo::GroupResult do
  [:group, :result].each do |attribute|
    it {should validate_presence_of attribute}
  end
end
