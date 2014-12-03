require 'spec_helper'

describe Popolo::Person do
  [:birth_date, :death_date].each do |attribute|
    it_should_behave_like 'a model with a date attribute', attribute
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
