# encoding: utf-8

require 'spec_helper'

describe AppFigures do
  context '.client with option hash' do

    before do
      @appfigures = AppFigures.client({client_key: 'your client key', credentials:'base 64 encoded username:password' })
    end

    it 'can configure a client key' do
      @appfigures.client_key.must_equal 'your client key'
    end

    it 'can configure credentials' do
      @appfigures.credentials.must_equal 'base 64 encoded username:password'
    end

  end

  context '.client with env vars' do
    before do
      ENV['client_key'] = 'abcd'
      ENV['credentials'] = '1234'
    end

    after do
      ENV.delete('client_key')
      ENV.delete('credentials')
    end

    it 'inits a new client object with ENV vars' do
      AppFigures.client.must_be_instance_of AppFigures::Client
    end
  end
end
