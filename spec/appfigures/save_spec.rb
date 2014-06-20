# encoding: utf-8

require 'spec_helper'

describe AppFigures::Client do
  context '.sales' do
    it 'includes httparty' do
      AppFigures::Client.included_modules.must_include HTTParty
    end
  end
end
