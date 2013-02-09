require 'spec_helper'

describe Popolo::Sluggable do
  describe '.included' do
    describe '#new' do
      subject {Cat.new}

      [:name, :slug].each do |attribute|
        it {should validate_presence_of attribute}
      end

      context 'with a custom slug source' do
        subject {Dog.new}

        [:moniker, :slug].each do |attribute|
          it {should validate_presence_of attribute}
        end

        it {should_not validate_presence_of :name}
      end
    end

    describe '#slug_source' do
      it 'should default to :name' do
        Cat.slug_source.should == :name
      end

      context 'with a custom slug source' do
        it 'should use the custom slug source' do
          Dog.slug_source.should == :moniker
        end
      end
    end

    describe '#create' do
      it 'should set the slug' do
        Cat.create(name: 'Foo').slug.should == 'foo'
      end

      it 'should not set the slug if it is already set' do
        Cat.create(name: 'Foo', slug: 'bar').slug.should == 'bar'
      end

      it 'should not attempt to set the slug if the slug source is empty' do
        expect {Cat.create!}.to raise_error(Mongoid::Errors::Validations)
      end

      it 'should prevent duplicate slugs' do
        Cat.create name: 'Foo', slug: 'foo'
        expect {Cat.with(safe: true).create(name: 'Bar', slug: 'foo')}.to raise_error(Moped::Errors::OperationFailure)
      end

      context 'with a custom slug source' do
        it 'should set the slug' do
          Dog.create(moniker: 'Foo').slug.should == 'foo'
        end

        it 'should not set the slug if it is already set' do
          Dog.create(moniker: 'Foo', slug: 'bar').slug.should == 'bar'
        end

        it 'should not attempt to set the slug if the slug source is empty' do
          expect {Dog.create!}.to raise_error(Mongoid::Errors::Validations)
        end

        it 'should prevent duplicate slugs' do
          Dog.create moniker: 'Foo', slug: 'foo'
          expect {Dog.with(safe: true).create(moniker: 'Bar', slug: 'foo')}.to raise_error(Moped::Errors::OperationFailure)
        end
      end
    end

    describe '#find_by_slug' do
      let :resource do
        Cat.create(name: 'Foo')
      end

      it 'should find a resource by its slug' do
        Cat.find_by_slug(resource.slug).should == resource
      end

      it 'should find a resource by its slug source' do
        Cat.find_by_slug(resource.name).should == resource
      end

      context 'with a custom slug source' do
        let :resource do
          Dog.create(moniker: 'Foo')
        end

        it 'should find a resource by its slug' do
          Dog.find_by_slug(resource.slug).should == resource
        end

        it 'should find a resource by its slug source' do
          Dog.find_by_slug(resource.moniker).should == resource
        end
      end
    end

    describe '#find_by_slug_or_id' do
      let :resource do
        Cat.create(name: 'Foo')
      end

      it 'should find a resource by its slug' do
        Cat.find_by_slug_or_id(resource.slug).should == resource
      end

      it 'should find a resource by its slug source' do
        Cat.find_by_slug(resource.name).should == resource
      end

      it 'should find a resource by its ID' do
        Cat.find_by_slug_or_id(resource.id).should == resource
      end

      context 'with a custom slug source' do
        let :resource do
          Dog.create(moniker: 'Foo')
        end

        it 'should find a resource by its slug' do
          Dog.find_by_slug_or_id(resource.slug).should == resource
        end

        it 'should find a resource by its slug' do
          Dog.find_by_slug_or_id(resource.moniker).should == resource
        end

        it 'should find a resource by its ID' do
          Dog.find_by_slug_or_id(resource.id).should == resource
        end
      end
    end
  end
end
