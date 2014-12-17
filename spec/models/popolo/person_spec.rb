require 'rails_helper'

module Popolo
  RSpec.describe Person do
    [:birth_date, :death_date].each do |attribute|
      it_behaves_like 'a model with a date attribute', attribute
    end

    describe '#to_s' do
      it 'should return the name if the name, given name and family name are blank' do
        expect(FactoryGirl.build(:person, name: nil).to_s).to eq(nil)
      end

      it 'should return the given name and family name if the name is blank' do
        expect(FactoryGirl.build(:person, name: nil, given_name: 'John', family_name: 'Public').to_s).to eq('John Public')
      end

      it 'should return the family name if the name and given name are blank' do
        expect(FactoryGirl.build(:person, name: nil, family_name: 'Public').to_s).to eq('Public')
      end

      it 'should return the given name if the name and family name are blank' do
        expect(FactoryGirl.build(:person, name: nil, given_name: 'John').to_s).to eq('John')
      end

      it 'should return the name if present' do
        expect(FactoryGirl.build(:person, given_name: 'John', family_name: 'Public').to_s).to eq('John Q. Public')
      end
    end
  end
end
