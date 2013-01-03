require 'spec_helper'

describe Popolo::Eventable do
  describe '.included' do
    describe '#events' do
      let :resource do
        Cat.create name: 'Foo'
      end

      let :related_event do
        FactoryGirl.create :event, related: {cat: [resource.id]}
      end

      let :unrelated_event do
        FactoryGirl.create :event
      end

      it 'should find the events of a resource' do
        resource.events.should == [related_event]
      end
    end
  end
end
