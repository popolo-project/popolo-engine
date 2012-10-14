require 'spec_helper'

describe Popolo::Organization do
  [:name, :slug].each do |attribute|
    it {should validate_presence_of attribute}
  end

  describe '#create' do
    it 'should set the slug' do
      FactoryGirl.create(:organization).slug.should == 'abc-inc'
    end

    it 'should not set the slug if it is already set' do
      FactoryGirl.create(:organization, slug: 'bar').slug.should == 'bar'
    end

    it 'should not attempt to set the slug if the name is empty' do
      expect {Popolo::Organization.create!}.to raise_error(Mongoid::Errors::Validations)
    end

    it 'should prevent duplicate slugs' do
      Popolo::Organization.create name: 'Foo', slug: 'foo'
      expect {Popolo::Organization.with(safe: true).create(name: 'Bar', slug: 'foo')}.to raise_error(Moped::Errors::OperationFailure)
    end
  end

  describe '#find_by_slug' do
    let :organization do
      FactoryGirl.create(:organization)
    end

    it 'should find an organization by its slug' do
      Popolo::Organization.find_by_slug(organization.slug).should == organization
    end

    it 'should find an organization by its ID' do
      Popolo::Organization.find_by_slug(organization.id).should == organization
    end
  end
end
