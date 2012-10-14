require 'spec_helper'

describe Popolo::OrganizationalUnit do
  [:name, :slug].each do |attribute|
    it {should validate_presence_of attribute}
  end

  describe '#create' do
    it 'should set the slug' do
      FactoryGirl.create(:organizational_unit).slug.should == 'marketing'
    end

    it 'should not set the slug if it is already set' do
      FactoryGirl.create(:organizational_unit, slug: 'bar').slug.should == 'bar'
    end

    it 'should not attempt to set the slug if the name is empty' do
      expect {Popolo::OrganizationalUnit.create!}.to raise_error(Mongoid::Errors::Validations)
    end
  end

  describe '#find_by_slug' do
    let :organizational_unit do
      FactoryGirl.create(:organizational_unit)
    end

    it 'should find an organizational unit by its slug' do
      Popolo::OrganizationalUnit.find_by_slug(organizational_unit.slug).should == organizational_unit
    end

    it 'should find an organizational unit by its ID' do
      Popolo::OrganizationalUnit.find_by_slug(organizational_unit.id).should == organizational_unit
    end
  end
end
