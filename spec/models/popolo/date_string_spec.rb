require 'spec_helper'

describe Popolo::DateString do
  let :date do
    Date.new(2011, 2, 3)
  end

  let :date_string_year_month_day do
    Popolo::DateString.new('2011-02-03')
  end

  let :date_string_year_month do
    Popolo::DateString.new('2011-02')
  end

  let :date_string_year do
    Popolo::DateString.new('2011')
  end

  let :date_string_empty do
    Popolo::DateString.new('')
  end

  let :year_month_day do
    '2011-02-03'
  end

  let :year_month do
    '2011-02'
  end

  let :year do
    '2011'
  end

  let :empty do
    ''
  end

  describe '#mongoize' do
    it 'returns a string' do
      date_string_year_month_day.mongoize.should == year_month_day
    end

    it 'returns a string if day truncated' do
      date_string_year_month.mongoize.should == year_month
    end

    it 'returns a string if month and day truncated' do
      date_string_year.mongoize.should == year
    end

    it 'returns nil if empty string' do
      date_string_empty.mongoize.should == nil
    end
  end

  describe '.demongoize' do
    it 'returns a date' do
      Popolo::DateString.demongoize(year_month_day).mongoize.should == date
    end

    it 'returns a string if day truncated' do
      Popolo::DateString.demongoize(year_month).mongoize.should == year_month
    end

    it 'returns a string if month and day truncated' do
      Popolo::DateString.demongoize(year).mongoize.should == year
    end

    it 'returns nil if empty string' do
      Popolo::DateString.demongoize(empty).mongoize.should == nil
    end
  end

  describe '.mongoize' do
    it 'returns a string when given a date' do
      Popolo::DateString.mongoize(date).should == year_month_day
    end

    it 'returns a string when given a date string' do
      Popolo::DateString.mongoize(date_string_year_month_day).should == year_month_day
      Popolo::DateString.mongoize(date_string_year_month).should == year_month
      Popolo::DateString.mongoize(date_string_year).should == year
    end

    it 'returns a string when given a string' do
      Popolo::DateString.mongoize(year_month_day).should == year_month_day
      Popolo::DateString.mongoize(year_month).should == year_month
      Popolo::DateString.mongoize(year).should == year
    end

    it 'returns nil when given an empty string' do
      Popolo::DateString.mongoize(date_string_empty).should == nil
      Popolo::DateString.mongoize(empty).should == nil
    end
  end

  describe '.evolve' do
    it 'returns a string when given a date' do
      Popolo::DateString.evolve(date).should == year_month_day
    end

    it 'returns a string when given a date string' do
      Popolo::DateString.evolve(date_string_year_month_day).should == year_month_day
      Popolo::DateString.evolve(date_string_year_month).should == year_month
      Popolo::DateString.evolve(date_string_year).should == year
    end

    it 'returns a string when given a string' do
      Popolo::DateString.evolve(year_month_day).should == year_month_day
      Popolo::DateString.evolve(year_month).should == year_month
      Popolo::DateString.evolve(year).should == year
    end

    it 'returns nil when given an empty string' do
      Popolo::DateString.evolve(date_string_empty).should == nil
      Popolo::DateString.evolve(empty).should == nil
    end
  end
end
