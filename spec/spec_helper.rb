# encoding: utf-8

# bootstrap the environment
ENV['RACK_ENV'] = 'test'
lib_path = File.expand_path('../lib', __FILE__)
($:.unshift lib_path) unless ($:.include? lib_path)

# require dependencies
require 'bundler'
Bundler.setup(:default, ENV['RACK_ENV'])

#require gem
require 'app_figures'

#require BDD Stack
require 'mocha/mini_test'
require 'minitest/autorun'
require "minitest-spec-context"
require 'minitest/reporters'


module Response
  #code from httparty

  def self.last_modified
    Date.new(2010, 1, 15).to_s
  end

  def self.content_length
    '1024'
  end

  def self.request_object
    HTTParty::Request.new Net::HTTP::Get, '/'
  end

  def self.parsed_response
    lambda { {"foo" => "bar"} }
  end

  def self.bad
    response_object = Net::HTTPOK.new('1.1', 500, 'NOT FOUND')
    response_object.stubs(:body).returns("{foo:'bar'}")
    response_object['last-modified'] = last_modified
    response_object['content-length'] = content_length
    response = HTTParty::Response.new(request_object, response_object, parsed_response)
  end

  def self.not_found
    response_object = Net::HTTPOK.new('1.1', 404, 'NOT FOUND')
    response_object.stubs(:body).returns("{foo:'bar'}")
    response_object['last-modified'] = last_modified
    response_object['content-length'] = content_length
    response = HTTParty::Response.new(request_object, response_object, parsed_response)

  end

  def self.ok
    response_object = Net::HTTPOK.new('1.1', 200, 'OK')
    response_object.stubs(:body).returns("{foo:'bar'}")
    response_object['last-modified'] = last_modified
    response_object['content-length'] = content_length
    response = HTTParty::Response.new(request_object, response_object, parsed_response)
  end

end

#  all systems go
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new
