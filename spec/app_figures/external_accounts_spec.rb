# encoding: utf-8

require 'spec_helper'

describe AppFigures::Client do
  context 'products' do

    before do
      @client = AppFigures::Client.new({client_key: 'exampleclientkey', credentials: 'examplebase64encodedstring'})
      @headers = { 'X-Client-Key' => @client.client_key, 'Authorization' => "Basic #{@client.credentials}" }
    end


    it 'makes an api request to external accounts' do
      @client.class.expects(:get)
      .with('/external_accounts', headers: @headers)
      .returns(Response.ok)

      @client.external_accounts
    end

  end
end
