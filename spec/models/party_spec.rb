require 'spec_helper'

describe Popolo::Party do
  [:name, :slug].each do |attribute|
    it {should validate_presence_of attribute}
  end
end
