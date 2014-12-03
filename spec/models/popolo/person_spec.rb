require 'spec_helper'

describe Popolo::Person do
  [:birth_date, :death_date].each do |attribute|
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

  describe '#to_s' do
    it 'should return the name if the name, given name and family name are blank' do
      FactoryGirl.build(:person, name: nil).to_s.should == nil
    end

    it 'should return the given name and family name if the name is blank' do
      FactoryGirl.build(:person, name: nil, given_name: 'John', family_name: 'Public').to_s.should == 'John Public'
    end

    it 'should return the family name if the name and given name are blank' do
      FactoryGirl.build(:person, name: nil, family_name: 'Public').to_s.should == 'Public'
    end

    it 'should return the given name if the name and family name are blank' do
      FactoryGirl.build(:person, name: nil, given_name: 'John').to_s.should == 'John'
    end

    it 'should return the name if present' do
      FactoryGirl.build(:person, given_name: 'John', family_name: 'Public').to_s.should == 'John Q. Public'
    end
  end
end
