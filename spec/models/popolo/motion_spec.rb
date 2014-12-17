require 'rails_helper'

module Popolo
  RSpec.describe Motion do
    it_behaves_like 'a model with a date attribute', :date
  end
end
