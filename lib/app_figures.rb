require 'app_figures/version'
require 'app_figures/client'

module AppFigures
  def self.configure
    client = Client.new
    yield client
    client
  end
end
