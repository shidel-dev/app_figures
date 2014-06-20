module AppFigures

  class Client
    attr_accessor :client_key, :credentials

    def initialize(options = {}, &block)

      if block_given?
        block.call(self)
      else
        @client_key = options[:client_key] || ENV['client_key']
        @credentials = options[:credentials] || ENV['credentials']
      end
    end
  end
end