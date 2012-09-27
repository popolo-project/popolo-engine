require 'spec_helper'

describe Popolo::Person do
  [:name, :slug].each do |attribute|
    it {should validate_presence_of attribute}
  end

  describe '#create' do
    it 'should set the slug' do
      FactoryGirl.create(:person).slug.should == 'foo'
    end

    it 'should not set the slug if it is already set' do
      FactoryGirl.create(:person, slug: 'bar').slug.should == 'bar'
    end

    it 'should not attempt to set the slug if the name is empty' do
      expect {Popolo::Person.create!}.to raise_error(Mongoid::Errors::Validations)
    end
  end

  describe '#find_by_slug' do
    let :person do
      FactoryGirl.create(:person)
    end

    it 'should find a person by their slug' do
      Popolo::Person.find_by_slug(person.slug).should == person
    end

    it 'should find a person by their ID' do
      Popolo::Person.find_by_slug(person.id).should == person
    end
  end
end
