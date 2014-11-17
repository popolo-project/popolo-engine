require 'spec_helper'

describe Popolo::Organization do

  it "should be able to save two siblings" do
    org1 = FactoryGirl.create(:organization)
    org2 = FactoryGirl.create(:organization)
    Popolo::Organization.all.size.should eq(2)
  end

  [:founding_date, :dissolution_date].each do |attribute|
    it {
      should validate_format_of(attribute).
        # 4.1.2.2 Basic format
        not_to_allow('20041231').
        # 4.1.2.2 Extended format
        to_allow('2004-12-31').
        # 4.1.2.3 a) A specific month
        to_allow('2004-01').
        # 4.1.2.3 b) A specific year
        to_allow('2004').
        # 4.1.2.3 c) A specific century
        not_to_allow('20').
        # Avoid confusion with YYMMDD
        not_to_allow('200401').
        # Date and time of day.
        not_to_allow('2004-12-31T00:00:00Z')
    }
  end

  it "should not be able to update to an invalid date" do
    org1 = FactoryGirl.create(:organization)
    org1.founding_date = "0"
    org1.valid?.should == false
  end
end
