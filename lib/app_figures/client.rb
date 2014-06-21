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
      response = self.class.get('/sales', query: query, headers: authorization_headers)
      handle_request_status(response.code)
      response
    end

    def product_by_id(id)
      response = self.class.get("/products/#{id}", headers: authorization_headers)
      handle_request_status(response.code)
      response
    end

    def list_products(store = nil)
      if store
        query = {store: store}
      else
        query = {}
      end

      response = self.class.get("/products/mine", query: query, headers: authorization_headers)
      handle_request_status(response.code)
      response
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
      if client_key.nil? or client_key == ''
        raise Errors::AuthorizationError.new('client_key is required.')
      end

      if credentials.nil? or credentials == ''
        raise Errors::AuthorizationError.new('credentials is required.')
      end
    end

    def handle_request_status(status)
      case status
        when 404
          raise Errors::NotFound.new
        when 500...600
          raise Errors::BadRequest.new(status)
      end
    end
  end
end
