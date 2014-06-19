require 'appfigures/version'
require 'appfigures/client'

module Appfigures
  def self.configure
    client = self::Client.new
    yield client
    client
  end
end
