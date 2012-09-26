require 'spec_helper'

describe Popolo::Division do
  [:name, :slug].each do |attribute|
    it {should validate_presence_of attribute}
  end

  context 'when creating a division' do
    it 'should set the slug' do
      Popolo::Division.create!(name: 'Foo').slug.should == 'foo'
    end

    it 'should not set the slug if it is already set' do
      Popolo::Division.create!(name: 'Foo', slug: 'bar').slug.should == 'bar'
    end

    it 'should not attempt to set the slug if the name is empty' do
      expect {Popolo::Division.create!}.to raise_error(Mongoid::Errors::Validations)
    end
  end
end
