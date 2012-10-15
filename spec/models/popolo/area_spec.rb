require 'spec_helper'

describe Popolo::Area do
  describe '#create' do
    it 'should prevent duplicate names' do
      Popolo::Area.create name: 'Foo', slug: 'foo'
      expect {Popolo::Area.with(safe: true).create(name: 'Foo', slug: 'bar')}.to raise_error(Moped::Errors::OperationFailure)
    end
  end
end
