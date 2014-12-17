require 'rails_helper'

module Popolo
  RSpec.describe Identifier do
    it {should validate_presence_of :identifier}
  end
end
