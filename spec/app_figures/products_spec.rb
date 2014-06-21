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

      @client.list_products('apple')
    end
  end
end
