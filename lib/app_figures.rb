# encoding: utf-8
require 'httparty'
require 'app_figures/version'
require 'app_figures/client'

module AppFigures
  def self.client(options = {})
    Client.new(options)
  end
end
