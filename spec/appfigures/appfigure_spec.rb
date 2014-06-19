# encoding: utf-8

require 'spec_helper'

describe Appfigures do
  context '.new' do

    before do
      @appfigures = Appfigures.new do |config|
        config.api_version = '2.0'
        config.auth_stratgy = 'Basic'
        config.client_key = 'your client key'
        config.credentials = 'base 64 encoded username:password'
      end
    end

    it 'yields Appfigures::Client for configuration' do
      Appfigures.new do |config|
        config.must_be_instance_of Appfigures::Client
      end
    end

    it 'can configure an api version' do
      @appfigures.api_version.must_equal '2.0'
    end

    it 'can configure an auth stratgy' do
      @appfigures.auth_stratgy.must_equal 'Basic'
    end

    it 'can configure a client key' do
      @appfigures.client_key.must_equal 'your client key'
    end

    it 'can configure credentials' do
      @appfigures.credentials.must_equal 'base 64 encoded username:password'
    end
  end
end
