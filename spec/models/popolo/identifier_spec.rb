require 'spec_helper'

describe Popolo::Identifier do
  it {should validate_presence_of :identifier}
end
