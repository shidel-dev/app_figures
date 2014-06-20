# Appfigures

[![Build Status](https://travis-ci.org/styleseek/appfigures.svg?branch=gem-setup)](https://travis-ci.org/styleseek/appfigures)
[![Code Climate](https://codeclimate.com/github/styleseek/appfigures.png)](https://codeclimate.com/github/styleseek/appfigures)

Simple Ruby client for tracking mobile applications with AppFigures.com's api.

## Installation

Add this line to your application's Gemfile:

    gem 'appfigures'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install appfigures

## Usage
###configuration

Your authentication information can be configured in three different ways.

####ENV variables
This is the preferred method as it keeps your config details in a private file. When using this method you can use a shortcut for creating a new client.

```ruby
AppFigures.create_client
```
This method will return a client object.

####Configure block

```ruby
client = AppFigures.configure do |config|
  config.client_key = 'your client key'
  config.credentials = 'base 64 encoded username:password'
end

```

This method will return a client object.

####Using AppFigures::Client initialize method directly

This can take an options hash with your authentication information.

```ruby
AppFigures::Client.new({credentials: 'base 64 encoded username:password', client_key: 'your client key'})
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/appfigures/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
