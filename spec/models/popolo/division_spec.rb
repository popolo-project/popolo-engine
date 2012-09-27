require 'spec_helper'

describe Popolo::Division do
  [:name, :slug].each do |attribute|
    it {should validate_presence_of attribute}
  end

  describe '#create' do
    it 'should set the slug' do
      FactoryGirl.create(:division).slug.should == 'foo'
    end

    it 'should not set the slug if it is already set' do
      FactoryGirl.create(:division, slug: 'bar').slug.should == 'bar'
    end

    it 'should not attempt to set the slug if the name is empty' do
      expect {Popolo::Division.create!}.to raise_error(Mongoid::Errors::Validations)
    end
  end

  describe '#find_by_slug' do
    let :division do
      FactoryGirl.create(:division)
    end

    it 'should find a division by its slug' do
      Popolo::Division.find_by_slug(division.slug).should == division
    end

    it 'should find a division by its ID' do
      Popolo::Division.find_by_slug(division.id).should == division
    end
  end
end
