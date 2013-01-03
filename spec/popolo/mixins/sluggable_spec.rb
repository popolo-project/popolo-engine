require 'spec_helper'

describe Popolo::Sluggable do
  describe '.included' do
    describe '#new' do
      subject {Cat.new}

      [:name, :slug].each do |attribute|
        it {should validate_presence_of attribute}
      end
    end

    describe '#create' do
      it 'should set the slug' do
        Cat.create(name: 'Foo').slug.should == 'foo'
      end

      it 'should not set the slug if it is already set' do
        Cat.create(name: 'Foo', slug: 'bar').slug.should == 'bar'
      end

      it 'should not attempt to set the slug if the name is empty' do
        expect {Cat.create!}.to raise_error(Mongoid::Errors::Validations)
      end

      it 'should prevent duplicate slugs' do
        Cat.create name: 'Foo', slug: 'foo'
        expect {Cat.with(safe: true).create(name: 'Bar', slug: 'foo')}.to raise_error(Moped::Errors::OperationFailure)
      end
    end

    describe '#find_by_slug' do
      let :resource do
        Cat.create(name: 'Foo')
      end

      it 'should find a resource by its slug' do
        Cat.find_by_slug(resource.slug).should == resource
      end

      it 'should find a resource by its ID' do
        Cat.find_by_slug(resource.id).should == resource
      end
    end
  end
end
