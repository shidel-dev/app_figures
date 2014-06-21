# encoding: utf-8

require 'spec_helper'

describe AppFigures::Client do
  context 'products' do

    before do
      @client = AppFigures::Client.new({client_key: 'exampleclientkey', credentials: 'examplebase64encodedstring'})
    end

    it 'can get a product by id' do
      @client.class.expects(:get)
      .with('/products/212135374',
          headers: {
            'X-Client-Key' => @client.client_key,
            'Authorization' => "Basic #{@client.credentials}"
          }
        )

      @client.product_by_id(212135374)
    end

    it 'can list all products' do
      @client.class.expects(:get)
      .with('/products/mine',
        query: {},
        headers: {
          'X-Client-Key' => @client.client_key,
          'Authorization' => "Basic #{@client.credentials}"
        }
      )
      .returns(Response.ok)

      @client.list_products
    end

    it 'can list all products scoped to a store' do
      @client.class.expects(:get)
      .with('/products/mine',
        query: {store: 'apple'},
        headers: {
          'X-Client-Key' => @client.client_key,
          'Authorization' => "Basic #{@client.credentials}"
        }
      )
      .returns(Response.ok)
      @client.list_products('apple')
    end


    it 'throws a not found error for a 404 code' do
      @client.class.expects(:get)
      .with('/products/mine',
        query: {store: 'google_play'},
        headers: {
          'X-Client-Key' => @client.client_key,
          'Authorization' => "Basic #{@client.credentials}"
        }
      )
      .returns(Response.not_found)

       Proc.new{ @client.list_products('google_play') }.must_raise AppFigures::Errors::NotFound
    end

    it 'throws a bad request error for a 500 to 600 code' do
      @client.class.expects(:get)
      .with('/products/mine',
        query: {store: 'amazon'},
        headers: {
          'X-Client-Key' => @client.client_key,
          'Authorization' => "Basic #{@client.credentials}"
        }
      )
      .returns(Response.bad)

       Proc.new{ @client.list_products('amazon') }.must_raise AppFigures::Errors::BadRequest
    end
  end
end
