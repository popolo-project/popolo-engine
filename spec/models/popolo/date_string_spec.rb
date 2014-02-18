require 'spec_helper'

describe Popolo::DateString do
  let :date do
    Date.new(2011, 2, 3)
  end

  let :date_string do
    Popolo::DateString.new('2011-02-03')
  end

  let :string do
    '2011-02-03'
  end

  describe '#mongoize' do
    it 'returns a string' do
      date_string.mongoize.should == string
    end
  end

  describe '.demongoize' do
    it 'returns a date' do
      Popolo::DateString.demongoize(string).mongoize.should == date
    end
  end

  describe '.mongoize' do
    it 'returns a string when given a date' do
      Popolo::DateString.mongoize(date).should == string
    end

    it 'returns a string when given a string' do
      Popolo::DateString.mongoize(date_string).should == string
    end

    it 'returns a string when given a string' do
      Popolo::DateString.mongoize(string).should == string
    end
  end

  describe '.evolve' do
    it 'returns a string when given a date' do
      Popolo::DateString.mongoize(date).should == string
    end

    it 'returns a string when given a string' do
      Popolo::DateString.mongoize(date_string).should == string
    end

    it 'returns a string when given a string' do
      Popolo::DateString.mongoize(string).should == string
    end
  end
end
