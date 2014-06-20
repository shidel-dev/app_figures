# encoding: utf-8

require 'spec_helper'

describe AppFigures::Client do
  context '.new with env vars' do

    before do
      ENV['APPFIGURES_CLIENT_KEY'] = 'abc'
      ENV['APPFIGURES_CREDENTIALS'] = '123'
    end

    after do
      ENV.delete('APPFIGURES_CLIENT_KEY')
      ENV.delete('APPFIGURES_CREDENTIALS')
    end

    it 'takes an option hash' do
      client = AppFigures::Client.new({client_key: 'my client key', credentials: "my credentials"})

      client.client_key.wont_be_nil
      client.credentials.wont_be_nil
    end

    it 'defualts to env vars if no block or options hash is given' do
      client = AppFigures::Client.new()

      client.client_key.wont_be_nil
      client.credentials.wont_be_nil
    end
  end

  context '.new without env vars' do

    it 'throws error if credentials or client key is nil' do
      Proc.new{ AppFigures::Client.new }.must_raise ArgumentError
    end

  end

  it 'has a base url' do
    client = AppFigures::Client.new({client_key: 'my client key', credentials: "my credentials"})

    client.class.base_uri.must_equal 'https://api.appfigures.com/v2'
  end
end