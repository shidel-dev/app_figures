# encoding: utf-8

require 'spec_helper'

describe AppFigures do
  context '.configure' do

    before do
      @appfigures = AppFigures.configure do |config|
        config.client_key = 'your client key'
        config.credentials = 'base 64 encoded username:password'
      end
    end

    it 'passes instance of Appfigures::Client for configuration' do
      AppFigures.configure do |config|
        config.client_key = 'your client key'
        config.credentials = 'base 64 encoded username:password'
        config.must_be_instance_of AppFigures::Client
      end
    end

    it 'can configure a client key' do
      @appfigures.client_key.must_equal 'your client key'
    end

    it 'can configure credentials' do
      @appfigures.credentials.must_equal 'base 64 encoded username:password'
    end
  end
end
