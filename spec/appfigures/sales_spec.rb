# encoding: utf-8

require 'spec_helper'

describe AppFigures::Client do
  context '.sales' do
    before do
      @client = AppFigures::Client.new({client_key: 'my client key', credentials: "my credentials"})

      HTTParty.expects(:get)
      .with('https://api.appfigures.com/v2/sales',
        headers: {'X-Client-Key' => '!@#$abc','Authorization' => 'Basic @fju123%&jkds'})
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


    it 'uses HTTParty::get and gets a result' do
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
