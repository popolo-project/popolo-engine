require 'spec_helper'

describe Popolo::Area do
  [:name, :slug].each do |attribute|
    it {should validate_presence_of attribute}
  end

  describe '#create' do
    it 'should set the slug' do
      FactoryGirl.create(:area).slug.should == 'foo'
    end

    it 'should not set the slug if it is already set' do
      FactoryGirl.create(:area, slug: 'bar').slug.should == 'bar'
    end

    it 'should not attempt to set the slug if the name is empty' do
      expect {Popolo::Area.create!}.to raise_error(Mongoid::Errors::Validations)
    end
  end

  describe '#find_by_slug' do
    let :area do
      FactoryGirl.create(:area)
    end

    it 'should find a area by its slug' do
      Popolo::Area.find_by_slug(area.slug).should == area
    end

    it 'should find a area by its ID' do
      Popolo::Area.find_by_slug(area.id).should == area
    end
  end
end
