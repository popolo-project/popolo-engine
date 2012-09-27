require 'spec_helper'

describe Popolo::Source do
  [:name, :last_modified].each do |attribute|
    it {should validate_presence_of attribute}
  end
end
