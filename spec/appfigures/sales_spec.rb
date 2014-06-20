# encoding: utf-8

require 'spec_helper'

describe AppFigures::Client do
  context '.sales' do
    before do
      @client = AppFigures::Client.new({client_key: 'ccfihtger13jfhels', credentials: 'Basic YSHFH123HTJDOF=='})

      @client.class.expects(:get)
      .with('/v2/sales',
        headers: {'X-Client-Key' => @client.client_key, 'Authorization' => @client.credentials})
      .returns({"downloads"=>1000,
                "updates"=>2000,
                "returns"=>0,
                "net_downloads"=>3000,
                "promos"=>0,
                "revenue"=>"0.00",
                "edu_downloads"=>0,
                "gifts"=>0,
                "gift_redemptions"=>0})

    end


    it 'uses HTTParty::get' do
      @client.sales().must_equal({"downloads"=>1000,
                "updates"=>2000,
                "returns"=>0,
                "net_downloads"=>3000,
                "promos"=>0,
                "revenue"=>"0.00",
                "edu_downloads"=>0,
                "gifts"=>0,
                "gift_redemptions"=>0})
    end
  end
end
