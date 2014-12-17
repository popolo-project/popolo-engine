require 'rails_helper'

module Popolo
  RSpec.describe Link do
    it {should validate_presence_of :url}
  end
end
