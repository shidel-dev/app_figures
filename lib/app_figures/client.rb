# encoding: utf-8

module AppFigures
  class Client
    include HTTParty
    base_uri 'https://api.appfigures.com/v2'

    attr_accessor :client_key, :credentials

    def initialize(options = {})
      options ||= {}
      options = default_options.merge(options)

      @client_key = options[:client_key]
      @credentials = options[:credentials]

      raise(ArgumentError) unless valid_client?
    end

    def sales(query = {})
      options = headers
      options = headers.merge({ query: query }) unless query.empty?

      self.class.get('/sales', options)
    end

    def product_by_id(id)
      self.class.get("/products/#{id}", headers)
    end

    private

    def default_options
      {
        client_key: ENV['APPFIGURES_CLIENT_KEY'],
        credentials: ENV['APPFIGURES_CREDENTIALS']
      }
    end

    def headers
      {
        headers: {
          'X-Client-Key' => @client_key,
          'Authorization' => @credentials
        }
      }
    end

    def valid_client?
      @client_key.nil? == false && @credentials.nil? == false
    end

  end
end