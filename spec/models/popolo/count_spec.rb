require 'rails_helper'

module Popolo
  RSpec.describe Count do
    [:option, :value].each do |attribute|
      it {should validate_presence_of attribute}
    end
  end
end
