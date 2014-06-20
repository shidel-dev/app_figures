# encoding: utf-8

require 'spec_helper'

describe AppFigures::Client do
  context '.products' do
    before do
      @client = AppFigures::Client.new({client_key: 'exampleclientkey', credentials: 'examplebase64encodedstring'})


      @client.class.expects(:get)
        .with('/products/212135374',
          headers: { 'X-Client-Key' => @client.client_key, 'Authorization' => "Basic #{@client.credentials}" })
        .returns({
          id: 212135374,
          name: "Rdio",
          developer: "Rdio",
          icon: "http://ecx.images-amazon.com/images/I/51IPlKhP19L._SL160_SL150_.png",
          vendor_identifier: "B004T76OR8",
          package_name: "B004T76OR8",
          store_id: 3,
          store: "amazon_appstore",
          release_date: "2000-01-01T05:00:00-05:00",
          added_date: "2012-05-30T19:16:43-04:00",
          updated_date: "2013-07-02T21:00:00-04:00",
          version: "2.6.3",
          source: nil,
          type: "unknown",
          devices: [
            "Handheld"
          ],
          price: {
            currency: "USD",
            price: "0.00"
          }
        })
    end


    it 'can get a product by id' do
      @client.product_by_id(212135374).must_equal({
        id: 212135374,
        name: "Rdio",
        developer: "Rdio",
        icon: "http://ecx.images-amazon.com/images/I/51IPlKhP19L._SL160_SL150_.png",
        vendor_identifier: "B004T76OR8",
        package_name: "B004T76OR8",
        store_id: 3,
        store: "amazon_appstore",
        release_date: "2000-01-01T05:00:00-05:00",
        added_date: "2012-05-30T19:16:43-04:00",
        updated_date: "2013-07-02T21:00:00-04:00",
        version: "2.6.3",
        source: nil,
        type: "unknown",
        devices: [
          "Handheld"
        ],
        price: {
          currency: "USD",
          price: "0.00"
        }
      })
    end
  end
end