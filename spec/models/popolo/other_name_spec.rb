require 'rails_helper'

module Popolo
  RSpec.describe OtherName do
    it {should validate_presence_of :name}

    [:start_date, :end_date].each do |attribute|
      it_behaves_like 'a model with a date attribute', attribute
    end
  end
end
