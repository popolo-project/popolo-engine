require 'spec_helper'

describe Popolo::ContactDetail do
  [:type, :value].each do |attribute|
    it {should validate_presence_of attribute}
  end
end
