require 'rails_helper'

module Popolo
  RSpec.describe Organization do
    [:founding_date, :dissolution_date].each do |attribute|
      it_behaves_like 'a model with a date attribute', attribute
    end
  end
end
