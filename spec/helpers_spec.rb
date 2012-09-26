# coding: utf-8
require 'spec_helper'

describe Popolo::Helpers do
  describe '#slug' do
    it 'should downcase the string' do
      Popolo::Helpers.slug('FOO').should == 'foo'
    end

    it 'should normalize dashes' do
      Popolo::Helpers.slug("foo-bar–baz—qux").should == 'foo-bar-baz-qux'
    end

    it 'should normalize whitespace' do
      Popolo::Helpers.slug("foo bar\rbaz\nqux\tquux").should == 'foo-bar-baz-qux-quux'
    end

    it 'should strip leading and trailing dashes and whitespace' do
      Popolo::Helpers.slug("-–—foo \r\n\t").should == 'foo'
    end

    it 'should squeeze dashes and whitespace' do
      Popolo::Helpers.slug("foo-–— \r\n\tbar").should == 'foo-bar'
    end

    it 'should transliterate characters' do
      Popolo::Helpers.slug('hétérogénéité').should == 'heterogeneite'
    end
  end
end