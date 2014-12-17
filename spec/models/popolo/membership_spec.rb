require 'rails_helper'

module Popolo
  RSpec.describe Membership do
    [:organization_id, :person_id].each do |attribute|
      it {should validate_presence_of attribute}
    end

    [:start_date, :end_date].each do |attribute|
      it_behaves_like 'a model with a date attribute', attribute
    end
  end
end
