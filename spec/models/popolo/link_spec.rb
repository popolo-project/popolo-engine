require 'spec_helper'

describe Popolo::Link do
  it {should validate_presence_of :url}
end
