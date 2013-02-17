require 'spec_helper'

describe Popolo::Post do
  [:role, :organization_id].each do |attribute|
    it {should validate_presence_of attribute}
  end
end
