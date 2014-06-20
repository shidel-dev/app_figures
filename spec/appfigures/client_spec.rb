# encoding: utf-8

require 'spec_helper'

describe AppFigures::Client do
  context '.new' do

    it 'takes an option hash' do
      client = AppFigures::Client.new({client_key: 'my client key', credentials: "my credentials"})
      client.client_key.wont_be_nil
      client.credentials.wont_be_nil
    end
  end
end