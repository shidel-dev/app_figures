# encoding: utf-8

require 'spec_helper'

describe AppFigures::Client do

  it 'includes httparty' do
    AppFigures::Client.included_modules.must_include HTTParty
  end

  context '.new' do

    it 'takes an option hash' do
      client = AppFigures::Client.new({client_key: 'my client key', credentials: "my credentials"})
      client.client_key.wont_be_nil
      client.credentials.wont_be_nil
    end

    it 'defualts to env vars if no block or options hash given' do
      ENV['client_key'] = 'abcd'
      ENV['credentials'] = '1234'

      client = AppFigures::Client.new()

      client.client_key.wont_be_nil
      client.credentials.wont_be_nil

      ENV.delete('client_key')
      ENV.delete('credentials')
    end

    it 'throws error if credentials or client key is nil' do
      Proc.new{AppFigures::Client.new()}.must_raise ArgumentError
    end
  end
end