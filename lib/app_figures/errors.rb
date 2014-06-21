# encoding: utf-8

module AppFigures
  module Errors
    class AuthorizationError < StandardError
      attr_reader :message
      def initialize(message)
        @message = message
      end
    end
  end
end