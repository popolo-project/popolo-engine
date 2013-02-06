require 'spec_helper'

describe Popolo::Post do
  it {should validate_presence_of :organization_id}
end
