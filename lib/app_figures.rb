# encoding: utf-8

require 'app_figures/version'
require 'app_figures/client'

module AppFigures
  def self.configure(&block)
    Client.new({}, &block)
  end

  def self.create_client
    Client.new
  end
end
