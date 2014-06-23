# encoding: utf-8

require 'spec_helper'

describe AppFigures::Client do
  context '.sales' do
    before do
      @client = AppFigures::Client.new(client_key: 'exampleclientkey', credentials: 'examplebase64encodedstring')
      @headers = { 'X-Client-Key' => @client.client_key, 'Authorization' => "Basic #{@client.credentials}" }
    end

    it 'requests results' do
      options = { query: {}, headers: @headers }
      @client.class.expects(:get).with('/sales', options).returns(Response.ok)
      @client.sales
    end

    it 'requests results with a start date' do
      options = { query: { start_date: '2014-01-01' }, headers: @headers }
      @client.class.expects(:get).with('/sales', options).returns(Response.ok)
      @client.sales(start_date: '2014-01-01')
    end

    it 'raises error for bad request' do
      options = { query: { start_date: '2013-01-01' }, headers: @headers }
      @client.class.expects(:get).with('/sales', options).returns(Response.bad)
      Proc.new { @client.sales(start_date: '2013-01-01') }.must_raise AppFigures::Errors::BadRequest
    end

    it 'raises error for 403 forbidden error' do
      options = { query: { start_date: '2012-01-01' }, headers: @headers }
      @client.class.expects(:get).with('/sales', options).returns(Response.forbidden)
      Proc.new { @client.sales(start_date: '2012-01-01') }.must_raise AppFigures::Errors::Forbidden
    end
  end
end
