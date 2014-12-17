require 'rails_helper'

module Popolo
  RSpec.describe ContactDetail do
    [:type, :value].each do |attribute|
      it {should validate_presence_of attribute}
    end
  end
end
