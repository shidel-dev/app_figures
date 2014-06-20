# encoding: utf-8
require 'httparty'
require 'app_figures/version'
require 'app_figures/client'

module AppFigures
  def self.configure(&block)
    Client.new({}, &block)
  end

  def self.client
    Client.new
  end
end
