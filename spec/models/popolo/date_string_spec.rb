require 'rails_helper'

module Popolo
  RSpec.describe DateString do
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
        expect(date_string_year_month_day.mongoize).to eq(year_month_day)
      end

      it 'returns a string if day truncated' do
        expect(date_string_year_month.mongoize).to eq(year_month)
      end

      it 'returns a string if month and day truncated' do
        expect(date_string_year.mongoize).to eq(year)
      end

      it 'returns nil if empty string' do
        expect(date_string_empty.mongoize).to eq(nil)
      end
    end

    describe '.demongoize' do
      it 'returns a date' do
        expect(Popolo::DateString.demongoize(year_month_day).mongoize).to eq(date)
      end

      it 'returns a string if day truncated' do
        expect(Popolo::DateString.demongoize(year_month).mongoize).to eq(year_month)
      end

      it 'returns a string if month and day truncated' do
        expect(Popolo::DateString.demongoize(year).mongoize).to eq(year)
      end

      it 'returns nil if empty string' do
        expect(Popolo::DateString.demongoize(empty).mongoize).to eq(nil)
      end
    end

    describe '.mongoize' do
      it 'returns a string when given a date' do
        expect(Popolo::DateString.mongoize(date)).to eq(year_month_day)
      end

      it 'returns a string when given a date string' do
        expect(Popolo::DateString.mongoize(date_string_year_month_day)).to eq(year_month_day)
        expect(Popolo::DateString.mongoize(date_string_year_month)).to eq(year_month)
        expect(Popolo::DateString.mongoize(date_string_year)).to eq(year)
      end

      it 'returns a string when given a string' do
        expect(Popolo::DateString.mongoize(year_month_day)).to eq(year_month_day)
        expect(Popolo::DateString.mongoize(year_month)).to eq(year_month)
        expect(Popolo::DateString.mongoize(year)).to eq(year)
      end

      it 'returns nil when given an empty string' do
        expect(Popolo::DateString.mongoize(date_string_empty)).to eq(nil)
        expect(Popolo::DateString.mongoize(empty)).to eq(nil)
      end
    end

    describe '.evolve' do
      it 'returns a string when given a date' do
        expect(Popolo::DateString.evolve(date)).to eq(year_month_day)
      end

      it 'returns a string when given a date string' do
        expect(Popolo::DateString.evolve(date_string_year_month_day)).to eq(year_month_day)
        expect(Popolo::DateString.evolve(date_string_year_month)).to eq(year_month)
        expect(Popolo::DateString.evolve(date_string_year)).to eq(year)
      end

      it 'returns a string when given a string' do
        expect(Popolo::DateString.evolve(year_month_day)).to eq(year_month_day)
        expect(Popolo::DateString.evolve(year_month)).to eq(year_month)
        expect(Popolo::DateString.evolve(year)).to eq(year)
      end

      it 'returns nil when given an empty string' do
        expect(Popolo::DateString.evolve(date_string_empty)).to eq(nil)
        expect(Popolo::DateString.evolve(empty)).to eq(nil)
      end
    end
  end
end
