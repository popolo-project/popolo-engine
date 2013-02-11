require 'spec_helper'

describe Popolo::Area do
  it {should validate_presence_of :sort_name}

  describe '#create' do
    it 'should set the sort name' do
      Popolo::Area.create(name: 'Foo').sort_name.should == 'Foo'
    end

    it 'should not set the sort name if it is already set' do
      Popolo::Area.create(name: 'Foo', sort_name: 'Bar').sort_name.should == 'Bar'
    end
  end
end
