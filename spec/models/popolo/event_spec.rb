require 'spec_helper'

describe Popolo::Event do
  [:source, :url, :body, :issued_at].each do |attribute|
    it {should validate_presence_of attribute}
  end
end
