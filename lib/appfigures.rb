require 'appfigures/version'
require 'appfigures/client'

module Appfigures
  def self.new
    client = self::Client.new
    yield client
    client
  end
end
