# encoding: utf-8

module AppFigures
  module Errors
    class AuthorizationError < StandardError
      attr_reader :message
      def initialize(message)
        @message = message
      end
    end

    class NotFound < StandardError
      attr_reader :code
      def initialize
        @code = 404
      end
    end

    class BadRequest < StandardError
      attr_reader :code

      def initialize(code)
        @code = code
      end
    end

    class Forbidden < StandardError
      attr_reader :message

      def initialize(message)
        @message = message
      end
    end
  end
end