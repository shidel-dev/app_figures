# encoding: utf-8
require 'pry'
module AppFigures
  class Client
    include HTTParty
    base_uri 'https://api.appfigures.com'

    attr_accessor :client_key, :credentials

    def initialize(options = {}, &block)

      if block_given?
        block.call(self)
      else
        @client_key = options[:client_key] || ENV['client_key']
        @credentials = options[:credentials] || ENV['credentials']
      end

      raise(ArgumentError) unless valid_client?
    end

    def sales
      self.class.get('/v2/sales', headers: {'X-Client-Key' => @client_key, 'Authorization' => @credentials})
    end

    private

    def valid_client?
      @client_key.nil? == false && @credentials.nil? == false
    end

  end
end