require 'spec_helper'

describe Popolo do
  describe ".storage_options" do
    context "when default Popolo settings" do
      it "doesn't override any global settings" do
        expect(Popolo.storage_options).to eq Hash.new
      end
    end

    context "when custom Popolo settings are present" do
      before do
        module Popolo
          Popolo.storage_options[:database] = :popolo_test
        end
      end

      it "uses custom Popolo settings" do
        expect(Popolo.storage_options[:database]).to eq :popolo_test
      end

      after do
        Popolo.storage_options = {}
      end
    end
  end
end
