# encoding: utf-8

module AppFigures
  class Client
    include HTTParty
    base_uri 'https://api.appfigures.com/v2'

    attr_reader :client_key, :credentials

    def initialize(options = {})
      options ||= {}
      options = default_options.merge(options)

      @client_key = options[:client_key]
      @credentials = options[:credentials]

      check_configuration!
    end

    def sales(query = {})
      self.class.get('/sales', query: query, headers: authorization_headers)
    end

    def product_by_id(id)
      self.class.get("/products/#{id}", headers: authorization_headers)
    end

    def list_products(store = nil)
      if store
        query = {store: store}
      else
        query = {}
      end

      self.class.get("/products/mine", query: query, headers: authorization_headers)
    end

    private

    def authorization_headers
      {
        'X-Client-Key' => client_key,
        'Authorization' => "Basic #{credentials}"
      }
    end

    def default_options
      {
        client_key:  ENV['APPFIGURES_CLIENT_KEY'],
        credentials: ENV['APPFIGURES_CREDENTIALS']
      }
    end

    def check_configuration!
      raise ArgumentError, 'client_key is required.' if client_key.nil? or client_key == ''
      raise ArgumentError, 'credentials is required.' if credentials.nil? or credentials == ''
    end
  end
end
