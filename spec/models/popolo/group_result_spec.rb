require 'rails_helper'

module Popolo
  RSpec.describe GroupResult do
    [:group, :result].each do |attribute|
      it {should validate_presence_of attribute}
    end
  end
end
