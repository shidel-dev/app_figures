# Appfigures

[![Build Status](https://travis-ci.org/styleseek/appfigures.svg?branch=gem-setup)](https://travis-ci.org/styleseek/appfigures)

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

Your authentication information can be configured in three different ways

####ENV variables
This is the preferred method as it keeps your config details in a private file. When using this method you can use a shortcut for creating a new client

```ruby
AppFigures.create_client
```

####Configure block

```ruby
client = AppFigures.configure do |config|
  config.client_key = 'your client key'
  config.credentials = 'base 64 encoded username:password'
end
```

####Using AppFigures::Client's initialize method directly

this can take an options has

```ruby
AppFigures::Client.new({credentials: 'base 64 encoded username:password', client_key: 'your client key'})
```

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/appfigures/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
