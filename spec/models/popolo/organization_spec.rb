require 'spec_helper'

describe Popolo::Organization do

  it "should be able to save two siblings" do
    org1 = FactoryGirl.create(:organization)
    org2 = FactoryGirl.create(:organization)
    Popolo::Organization.all.size.should eq(2)
  end

  describe "date_formats" do
    subject { FactoryGirl.create(:organization) }

    it "should not allow basic format" do
      subject.founding_date = '20041231'
      subject.valid?.should == false
    end

    it "should not allow specific century" do
      subject.founding_date = '20'
      subject.valid?.should == false
    end

    it "should not allow time of day" do
      subject.founding_date = '2004-12-31T00:00:00Z'
      subject.valid?.should == false
    end

    it "should not allow confusion with YYMMDD" do
      subject.founding_date = '200401'
      subject.valid?.should == false
    end

    it "should allow specific month" do
      subject.founding_date = '2004-01'
      subject.valid?.should == true
    end

    it "should allow a specific year" do
      subject.founding_date = '2004'
      subject.valid?.should == true
    end
  end

end
