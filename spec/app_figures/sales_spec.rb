# encoding: utf-8

require 'spec_helper'

describe AppFigures::Client do
  context '.sales' do
    before do
      @basic_client = AppFigures::Client.new({client_key: 'exampleclientkey', credentials: 'Basic examplebase64encodedstring'})

      @basic_client.class.expects(:get)
        .with('/sales',
          {headers: {'X-Client-Key' => @basic_client.client_key, 'Authorization' => @basic_client.credentials}})
        .returns({
          "downloads"=>1000,
          "updates"=>2000,
          "returns"=>0,
          "net_downloads"=>3000,
          "promos"=>0,
          "revenue"=>"0.00",
          "edu_downloads"=>0,
          "gifts"=>0,
          "gift_redemptions"=>0
        })

      @query_client = AppFigures::Client.new({client_key: 'exampleclientkey', credentials: 'Basic examplebase64encodedstring'})

      @query_client.class.expects(:get)
        .with('/sales',
          {headers: {'X-Client-Key' => @query_client.client_key, 'Authorization' => @query_client.credentials}, query: {start_date: '2014-01-01'}})
        .returns({
          "downloads"=>3000,
          "updates"=>6000,
          "returns"=>0,
          "net_downloads"=>3000,
          "promos"=>0,
          "revenue"=>"0.00",
          "edu_downloads"=>0,
          "gifts"=>0,
          "gift_redemptions"=>0
        })
    end


    it 'uses HTTParty::get' do
      @basic_client.sales().must_equal({
        "downloads"=>1000,
        "updates"=>2000,
        "returns"=>0,
        "net_downloads"=>3000,
        "promos"=>0,
        "revenue"=>"0.00",
        "edu_downloads"=>0,
        "gifts"=>0,
        "gift_redemptions"=>0
      })
    end

    it 'accepts query params' do
      @query_client.sales({start_date: '2014-01-01'}).must_equal({
        "downloads"=>3000,
        "updates"=>6000,
        "returns"=>0,
        "net_downloads"=>3000,
        "promos"=>0,
        "revenue"=>"0.00",
        "edu_downloads"=>0,
        "gifts"=>0,
        "gift_redemptions"=>0
      })
    end
  end
end
