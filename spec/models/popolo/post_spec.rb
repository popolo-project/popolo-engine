require 'rails_helper'

module Popolo
  RSpec.describe Post do
    it {should validate_presence_of :organization_id}
  end
end
