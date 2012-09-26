require 'spec_helper'

describe Popolo::Address do
  [:name, :address].each do |attribute|
    it {should validate_presence_of attribute}
  end
end
