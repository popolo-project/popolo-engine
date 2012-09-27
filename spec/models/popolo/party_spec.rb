require 'spec_helper'

describe Popolo::Party do
  [:name, :slug].each do |attribute|
    it {should validate_presence_of attribute}
  end

  describe '#create' do
    it 'should set the slug' do
      FactoryGirl.create(:party).slug.should == 'foo'
    end

    it 'should not set the slug if it is already set' do
      FactoryGirl.create(:party, slug: 'bar').slug.should == 'bar'
    end

    it 'should not attempt to set the slug if the name is empty' do
      expect {Popolo::Party.create!}.to raise_error(Mongoid::Errors::Validations)
    end
  end

  describe '#find_by_slug' do
    let :party do
      FactoryGirl.create(:party)
    end

    it 'should find a party by its slug' do
      Popolo::Party.find_by_slug(party.slug).should == party
    end

    it 'should find a party by its ID' do
      Popolo::Party.find_by_slug(party.id).should == party
    end
  end
end
