require 'spec_helper'

describe PopoloHelper do
  before :all do
    @canada = FactoryGirl.create :area, name: 'Canada'
    @ontario = @canada.children.create name: 'Ontario'
    @acme = FactoryGirl.create :organization, name: 'Acme Corporation'
    @abc = @acme.children.create name: 'ABC, Inc.'
  end

  # Without this line, you get a NoMethodError for super. If this line is in the
  # before block, you get "undefined method `view_context' for nil:NilClass".
  it {helper.class.send :include, Popolo::Engine.routes.url_helpers}

  describe '#nested_areas_path' do
    it 'returns a path with slugs' do
      helper.nested_areas_path([@canada, @ontario]).should == '/popolo/areas/canada/ontario/areas'
    end
  end

  describe '#nested_area_path' do
    it 'returns a path with slugs' do
      helper.nested_area_path([@canada, @ontario]).should == '/popolo/areas/canada/ontario'
    end
  end

  describe '#nested_organizations_path' do
    it 'returns a path with slugs' do
      helper.nested_organizations_path([@acme, @abc]).should == '/popolo/organizations/acme-corporation/abc-inc/organizations'
    end
  end

  describe '#nested_organization_path' do
    it 'returns a path with slugs' do
      helper.nested_organization_path([@acme, @abc]).should == '/popolo/organizations/acme-corporation/abc-inc'
    end
  end
end
