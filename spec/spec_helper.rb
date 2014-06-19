# encoding: utf-8

# bootstrap the environment
ENV['RACK_ENV'] = 'test'
lib_path = File.expand_path('../lib', __FILE__)
($:.unshift lib_path) unless ($:.include? lib_path)

# require dependencies
require 'bundler'
Bundler.setup(:default, ENV['RACK_ENV'])

#require gem
require 'appfigures'

#require BDD Stack
require 'mocha/mini_test'
require 'minitest/autorun'
require "minitest-spec-context"
require 'minitest/reporters'

#  all systems go
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new