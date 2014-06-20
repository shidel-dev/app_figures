module AppFigures

  class Client
    attr_accessor :client_key, :credentials

    def initialize(options = {}, &block)

      if block_given?
        block.call(self)
      else
        @client_key = options[:client_key]
        @credentials = options[:credentials]
      end
    end
  end
end