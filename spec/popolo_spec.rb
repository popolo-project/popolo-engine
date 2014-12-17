require 'rails_helper'

RSpec.describe Popolo do
  describe '.storage_options' do
    context 'when using default storage options' do
      it 'should use default storage options' do
        expect(Popolo.storage_options).to eq({})
      end
    end

    context 'when using custom storage options' do
      before do
        Popolo.storage_options = {database: :test}
      end

      it 'should use custom storage options' do
        expect(Popolo.storage_options).to eq({database: :test})

        # We would need to reload the app.
        # expect(Popolo::Membership.storage_options).to   eq({database: :test})
        # expect(Popolo::Organization.storage_options).to eq({database: :test})
        # expect(Popolo::Person.storage_options).to       eq({database: :test})
        # expect(Popolo::Post.storage_options).to         eq({database: :test})
      end

      after do
        Popolo.storage_options = {}
      end
    end
  end

  describe '.storage_options_per_class' do
    context 'when using default storage options' do
      it 'should use default storage options' do
        expect(Popolo.storage_options_per_class).to eq({})
      end
    end

    context 'when using custom storage options' do
      before do
        Popolo.storage_options_per_class = {
          :Membership   => {collection: 'a'},
          :Organization => {collection: 'b'},
          :Person       => {collection: 'c'},
          :Post         => {collection: 'd'},
        }
      end

      it 'should use custom storage options' do
        expect(Popolo.storage_options_per_class).to eq({
          :Membership   => {collection: 'a'},
          :Organization => {collection: 'b'},
          :Person       => {collection: 'c'},
          :Post         => {collection: 'd'},
        })

        # We would need to reload the app.
        # expect(Popolo::Membership.storage_options).to   eq({collection: 'a'})
        # expect(Popolo::Organization.storage_options).to eq({collection: 'b'})
        # expect(Popolo::Person.storage_options).to       eq({collection: 'c'})
        # expect(Popolo::Post.storage_options).to         eq({collection: 'd'})
      end

      after do
        Popolo.storage_options = {}
      end
    end
  end
end
