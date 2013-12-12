require 'spec_helper'

describe Popolo::ConfigurableMongoid do
  describe ".configure_mongoid" do
    context "when default Popolo settings" do
      it "uses default Popolo settings to run store_in" do
        Popolo::Foo.configure_mongoid
        expect(Popolo::Foo.collection.database.name).to eq :default
      end
    end

    context "when custom Popolo settings are present" do
      it "uses Popolo settings to run store_in" do
        Popolo.database = :popolo_test
        Popolo::Foo.configure_mongoid
        expect(Popolo::Foo.collection.database.name).to eq :popolo_test
      end

      after do
        Popolo.database = "default"
        Popolo::Foo.configure_mongoid
      end
    end

    module Popolo
      class Foo
        include Mongoid::Document
        extend Popolo::ConfigurableMongoid
      end
    end
  end
end
